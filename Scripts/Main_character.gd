extends Area2D

signal hit

var SPEED:float = 300.0
var INITIAL_POSITION:Vector2 = Vector2(144, 624)
var LEVEL_EXTENSION:int = 10
var MAX_HEALTH := 3

var screenSize:Vector2 = Vector2.ZERO
var onGameplay:bool = false
var currentHealth := MAX_HEALTH

func _ready():
	screenSize = get_viewport_rect().size
	hide()

func _process(delta):
	if !onGameplay: return
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
	onGameplay=true
	show()
	position = INITIAL_POSITION
	$CollisionShape2D.disabled=false

func _on_area_entered(area:Area2D):
	print("Collided with ",area.name)
	if area.name != "Scientist" and area.name != "WillSmith":
		return
	onGameplay=false
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
