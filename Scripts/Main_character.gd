extends Area2D

signal hit

var SPEED = 300.0
var screenSize = Vector2.ZERO
var INITIAL_POSITION = Vector2(144, 624)
var LEVEL_EXTENSION = 10

func _ready():
	screenSize = get_viewport_rect().size
	self.hide()

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
	
	var velocity = Vector2.ONE*direction*SPEED
	position += velocity*delta
	position.x = clamp(position.x, 0, LEVEL_EXTENSION*screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)
	
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0

func _on_start_game():
	self.show()
	position = INITIAL_POSITION


func _on_body_entered(body):
	print("Collided with ",body.name)
	if body.name != "EnemyBody2D":
		return
	emit_signal("hit")
