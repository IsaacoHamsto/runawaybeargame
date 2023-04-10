extends Node2D

func _ready():
	$LabSprite.hide()
	$ForestSprite.hide()

func _on_start_game():
	$MainMenuSprite.hide()
	$LabSprite.show()
	$ForestSprite.hide()
