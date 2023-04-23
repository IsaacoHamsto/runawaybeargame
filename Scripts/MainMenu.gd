extends Control

var time:float = 0
@export var mainScene:PackedScene

func _ready():
	$TitleScreen/MarginContainer/VBoxContainer/PlayButton.grab_focus()
	$TitleScreen/Logo.pivot_offset = $TitleScreen/Logo.size/2

func _on_playButton_pressed():
	get_tree().change_scene_to_packed(mainScene)

func _on_leaveButton_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func _on_configButton_pressed():
	$ConfigMenu.popup_centered()

func logo_animate(t):
	var logoScale:Vector2 = Vector2.ONE
	logoScale=logoScale*(pow(sin(t), 2)/10+1)
	$TitleScreen/Logo.scale = logoScale

func _process(delta):
	time += delta
	if(time>=PI):
		time = 0
	logo_animate(time)
