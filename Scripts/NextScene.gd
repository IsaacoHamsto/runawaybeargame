extends Area2D

func _on_area_entered(area):
	owner.get_node("AnimationPlayer").play("fade_out")
	await owner.get_node("AnimationPlayer").animation_finished
	owner.level += 1
	get_tree().change_scene_to_file("res://Scenes/Levels/Level" + str(owner.level) + ".tscn")
