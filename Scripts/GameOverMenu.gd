extends ColorRect

@onready var replayButton: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ReplayButton")
@onready var mainmenuButton: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/MainMenuButton")

func _ready():
	replayButton.pressed.connect(restart)
	mainmenuButton.pressed.connect(go_to_mainMenu)

func on_gameOver():
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	show()

func go_to_mainMenu():
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")

func restart():
	hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
