extends Area2D

var SPEED = 150.0
var player
var RANGE = 100.0

func _ready():
	player = get_parent().get_node("Character")

func _process(delta):
	if self.name == "Scientist":
		RANGE = 450
		SPEED = 110
	if self.name == "WillSmith":
		RANGE = 100
		SPEED = 130
		$AnimatedSprite2D.play("walk")
	
	position.y = move_toward(position.y, player.get("position").y, SPEED*delta)
	
	if player.get("position").x < position.x:
		position.x = move_toward(position.x, player.get("position").x+RANGE, SPEED*delta)
	else:
		position.x = move_toward(position.x, player.get("position").x-RANGE, SPEED*0.8*delta)
	
	$AnimatedSprite2D.flip_h = position.x < player.get("position").x
	
