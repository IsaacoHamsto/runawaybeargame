extends CanvasLayer

signal gameOver

var time:float = 0
var player
@onready var healthContainer = get_node("HealthPanel/MarginContainer/HBoxContainer")

func _ready():
	player = get_parent().get_node("YSort/Character")

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	await $MessageTimer.timeout
	$MessageLabel.hide()

func show_health(health:int):
	for i in healthContainer.get_children():
		i.hide()
	for i in range(health):
		healthContainer.get_child(i).show()

func _on_gameOver():
	show_message("FIM DE JOGO")
	await $MessageTimer.timeout
	emit_signal("gameOver")

func _unhandled_input(event):
	if event.is_action_pressed("ui_pause"):
		$PauseMenu.pause()
	

func _process(delta):
	show_health(player.health)
