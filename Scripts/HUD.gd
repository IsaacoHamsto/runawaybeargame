extends CanvasLayer

signal start_game
var time:float = 0

func _ready():
	$MainMenu/Logo.pivot_offset = $MainMenu/Logo.size/2

func _on_playButton_pressed():
	$MainMenu.hide()
	emit_signal("start_game")

func _on_leaveButton_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func _on_configButton_pressed():
	$MainMenu.hide()
	$ConfigMenu.show()

func _on_mainMenuButton_pressed():
	$ConfigMenu.hide()
	$MainMenu.show()

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func _on_messageTimer_timeout():
	$MessageLabel.hide()

func show_game_over():
	show_message("FIM DE JOGO")

func logo_animate(t):
	var logoScale:Vector2 = Vector2.ONE
	logoScale=logoScale*(pow(sin(t), 2)/10+1)
	$MainMenu/Logo.scale = logoScale

func _process(delta):
	time += delta
	if(time>=PI):
		time = 0
	logo_animate(time)
