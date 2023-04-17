extends CharacterBody2D

var SPEED = 150.0
var player
var RANGE = 100.0

func _process(delta):
	player = get_parent().get_node("Character")
	
	if self.name == "Scientist":
		RANGE = 450
		SPEED = 80
	if self.name == "WillSmith":
		RANGE = 100
		SPEED = 150
	
	position.y = move_toward(position.y, player.get("position").y, SPEED*delta)
	
	if player.get("position").x < position.x:
		position.x = move_toward(position.x, player.get("position").x+RANGE, SPEED*delta)
	else:
		position.x = move_toward(position.x, player.get("position").x-RANGE, SPEED*delta)
	
	$AnimatedSprite2D.flip_h = player.get("position").x < position.x
	
