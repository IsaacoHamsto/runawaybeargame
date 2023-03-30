extends CharacterBody2D

var speed = 250.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction := Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction+=Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction+=Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		direction+=Vector2.UP
	if Input.is_action_pressed("ui_down"):
		direction+=Vector2.DOWN
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	var velocity = Vector2.ZERO
	velocity = Vector2.ONE*direction*speed
	position += velocity*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0
