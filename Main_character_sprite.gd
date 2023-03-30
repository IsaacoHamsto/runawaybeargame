extends AnimatedSprite2D

var direction = 0

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		direction = 1
	if Input.is_action_pressed("ui_right"):
		direction = 0
	self.flip_h=direction
