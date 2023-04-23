extends Area2D

var SPEED:float
var player
var RANGE:float

func _ready():
	player = get_parent().get_node("Character")

func _process(delta):
	if self.name == "Scientist":
		RANGE = 450
		SPEED = 105
	if self.name == "WillSmith":
		RANGE = 120
		SPEED = 140
		$AnimatedSprite2D.play("walk")
	
	position.y = move_toward(position.y, player.get("position").y, SPEED*.7*delta)
	if player.get("position").x < position.x:
		position.x = move_toward(position.x, player.get("position").x+RANGE, SPEED*delta)
	else:
		position.x = move_toward(position.x, player.get("position").x-RANGE, SPEED*delta)
	
	$AnimatedSprite2D.flip_h = position.x < player.get("position").x
	
