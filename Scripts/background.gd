extends Node2D

func _ready():
	$LabSprite.show()
	$ForestSprite.hide()

func _on_gameOver():
	#$LabSprite.hide()
	#$ForestSprite.hide()
	pass
