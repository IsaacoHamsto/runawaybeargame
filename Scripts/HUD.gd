extends CanvasLayer

signal gameOver

var time:float = 0
var player

func _ready():
	player = get_parent().get_node("YSort/Character")

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	await $MessageTimer.timeout
	$MessageLabel.hide()

func show_health(health:int):
	$HealthLabel.show()
	$HealthLabel.text = str("VIDA:", health)

func _on_gameOver():
	$HealthLabel.hide()
	show_message("FIM DE JOGO")
	await $MessageTimer.timeout
	emit_signal("gameOver")

func _unhandled_input(event):
	if event.is_action_pressed("ui_pause"):
		$PauseMenu.pause()
	

func _process(delta):
	show_health(player.health)
