extends CanvasLayer

var time:float = 0
var player

func _ready():
	player = get_parent().get_node("YSort/Character")

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_health(health:int):
	$HealthLabel.show()
	$HealthLabel.text = str("VIDA:", health)

func _on_messageTimer_timeout():
	pass

func _on_gameOver():
	$HealthLabel.hide()
	show_message("FIM DE JOGO")
	await $MessageTimer.timeout
	$MessageLabel.hide()

func _process(delta):
	show_health(player.currentHealth)
