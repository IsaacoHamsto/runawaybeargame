extends Node2D

func _ready():
	$MainMenuSprite.show()
	$LabSprite.hide()
	$ForestSprite.hide()

func _on_start_game():
	$MainMenuSprite.hide()
	$LabSprite.show()
	$ForestSprite.hide()
