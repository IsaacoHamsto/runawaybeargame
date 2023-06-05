extends HitBox

@export var SPEED:int=400

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction*SPEED*delta

func destroy():
	queue_free()

func _on_area_entered(hurtbox: HurtBox):
	if hurtbox==null: return
	destroy()

func _on_screen_exited():
	queue_free()
