extends CanvasLayer

signal start_game

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
