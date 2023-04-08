extends CanvasLayer

signal start_game
var time = 0

func _ready():
	$MainMenu/Logo.pivot_offset = $MainMenu/Logo.size/2

func _on_playButton_pressed():
	$MainMenu.hide()
	emit_signal("start_game")

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func _on_messageTimer_timeout():
	$MessageLabel.hide()

func show_game_over():
	show_message("FIM DE JOGO")

func logo_animate(t):
	var logoScale = Vector2.ONE
	logoScale=logoScale*(sin(t)/3+1)
	$MainMenu/Logo.scale = logoScale

func _process(delta):
	time += delta
	if(time>PI):
		time -= PI
	logo_animate(time)
