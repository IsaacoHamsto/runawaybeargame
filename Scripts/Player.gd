extends CharacterBody2D

signal game_over

var SPEED:float = 300.0
var INITIAL_POSITION:Vector2 = Vector2(144, 624)
var LEVEL_EXTENSION:int = 10
var MAX_HEALTH := 3

@onready var SCALE=$Sprite2D.scale.x
@onready var animation = $AnimationPlayer
@onready var screenSize:Vector2 = get_viewport_rect().size
var onGameplay:bool = false
var health := MAX_HEALTH

enum State{
	Idle,
	Walk,
	Attack,
	Hit
}
var current_state = State.Idle

func _ready():
	onGameplay=true
	position = INITIAL_POSITION
	$Sprite2D/HurtboxArea2D/HurtBoxShape2D.set_deferred("disabled", false)
	health = MAX_HEALTH

func _physics_process(delta):
	if !onGameplay: return
	if current_state!=State.Attack and current_state!=State.Hit: current_state=State.Idle
	
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	var direction := Vector2.ZERO
	if left: direction+=Vector2.LEFT
	if right: direction+=Vector2.RIGHT
	if up: direction+=Vector2.UP
	if down: direction+=Vector2.DOWN
	
	if Input.is_action_just_pressed("ui_attack"):
		attack()
	
	if direction.length() > 0 and current_state!=State.Hit: 
		if current_state!=State.Attack: current_state = State.Walk
		
		direction = direction.normalized()
		velocity = Vector2.ONE*direction*SPEED
		move_and_slide()
		position.x = clamp(position.x, 0, LEVEL_EXTENSION*screenSize.x)
		position.y = clamp(position.y, 0, screenSize.y)
	
	if direction.x != 0:
		$Sprite2D.scale.x = -SCALE if direction.x < 0 else SCALE
	
	match current_state:
		State.Idle:
			animation.play("idle")
		State.Walk:
			animation.play("walk")

func death():
	onGameplay=false
	hide()
	$Sprite2D/HurtboxArea2D/HurtBoxShape2D.set_deferred("disabled", true)
	emit_signal("game_over")

func attack():
	current_state=State.Attack
	animation.play("attack")
	await animation.animation_finished
	current_state=State.Idle

func take_damage(amount: int):
	health-=amount
	if health<=0:
		death()
	await get_tree().create_timer(1).timeout
