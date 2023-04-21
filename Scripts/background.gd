extends Node2D

func _ready():
	main_menu()

func _on_game_over():
	main_menu()

func main_menu():
	$MainMenuSprite.show()
	$LabSprite.hide()
	$ForestSprite.hide()

func _on_start_game():
	$MainMenuSprite.hide()
	$LabSprite.show()
	$ForestSprite.hide()
