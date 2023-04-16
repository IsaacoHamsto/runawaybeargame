extends CharacterBody2D

var SPEED = 150.0
var player
var RANGE = 100.0

func _process(delta):
	player = get_parent().get_node("Character")
	
	
	position = position.move_toward(player.get("position")+Vector2.LEFT*RANGE, SPEED*delta)
	
	$AnimatedSprite2D.flip_h = player.get("position").x < position.x
	
