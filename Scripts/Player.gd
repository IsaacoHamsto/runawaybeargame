extends CharacterBody2D

signal game_over

var SPEED:float = 300.0
var INITIAL_POSITION:Vector2 = Vector2(144, 624)
var LEVEL_EXTENSION:int = 10
var MAX_HEALTH := 3

var screenSize:Vector2 = Vector2.ZERO
var onGameplay:bool = false
var currentHealth := MAX_HEALTH

func _ready():
	screenSize = get_viewport_rect().size
	onGameplay=true
	position = INITIAL_POSITION
	$HurtBoxArea2D/HurtBoxShape2D.disabled=false
	currentHealth = MAX_HEALTH

func _physics_process(delta):
	if !onGameplay: return
	
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	var direction := Vector2.ZERO
	if left: direction+=Vector2.LEFT
	if right: direction+=Vector2.RIGHT
	if up: direction+=Vector2.UP
	if down: direction+=Vector2.DOWN
	
	if direction.length() > 0: direction = direction.normalized()
	
	velocity = Vector2.ONE*direction*SPEED
	move_and_slide()
	
	position.x = clamp(position.x, 0, LEVEL_EXTENSION*screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)
	
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0

func death():
	onGameplay=false
	hide()
	$HurtBoxArea2D/HurtBoxShape2D.set_deferred("disabled", true)
	emit_signal("game_over")

func _on_area_entered(area:Area2D):
	print("Collided with ",area.name)
	if !area.is_in_group("enemies"):
		return
	currentHealth-=1
	if currentHealth<=0:
		death()
