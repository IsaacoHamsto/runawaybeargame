extends ColorRect

@onready var playButton: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton")
@onready var configButton: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ConfigButton")
@onready var mainmenuButton: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/MainMenuButton")

func _ready():
	playButton.pressed.connect(unpause)
	configButton.pressed.connect(open_configMenu)

func pause():
	get_tree().paused = true
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func unpause():
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	get_tree().paused = false

func open_configMenu():
	$ConfigMenu.popup_centered()

func go_to_mainMenu():
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")
