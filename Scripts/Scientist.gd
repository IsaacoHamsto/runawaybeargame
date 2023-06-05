extends Enemy

@export var Projectile:PackedScene=preload("res://Scenes/ScientistProjetile.tscn")

func _init():
	SPEED=140
	MAX_HEALTH=2

func _ready():
	health=MAX_HEALTH
	animation.play("walk")
	rangeArea.area_entered.connect(_on_area_entered)
	rangeArea.area_exited.connect(_on_rangeArea_exited)
	SCALE=$Sprite2D.scale.x

func shoot():
	if !Projectile: return
	var projectile = Projectile.instantiate()
	get_tree().current_scene.get_node("YSort").add_child(projectile)
	projectile.position = position + Vector2(0, -124)
	var projectileRotation = 0 if position.x < player.position.x else PI
	projectile.rotation = projectileRotation

func _physics_process(delta):
	queue_redraw()
	velocity=Vector2.ZERO
	match current_state:
		State.Walking:
			follow_player()
			if inRange:
				_change_state(State.Attacking)
		State.Attacking:
			if animation.current_animation == "attack":
				await animation.animation_finished
			if !inRange: _change_state(State.Walking)
			else: _change_state(State.Attacking)
		State.Staggering:
			await animation.animation_finished
			_change_state(State.Walking)
	

func _on_area_entered(hurtbox: HurtBox):
	if hurtbox == null: return
	inRange = true

func _on_rangeArea_exited(hurtbox: HurtBox):
	if hurtbox == null: return
	inRange = false
