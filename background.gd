extends Node2D

func _ready():
	$LabSprite.hide()


func _on_start_game():
	$MainMenuSprite.hide()
	$LabSprite.show()
