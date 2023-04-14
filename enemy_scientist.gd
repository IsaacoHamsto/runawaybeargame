extends CharacterBody2D

var speed = 200.0

func _process(delta):
	var direction := Vector2.ZERO
	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0
	
