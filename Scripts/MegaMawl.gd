extends Enemy

signal start_bossfight

const ATTACK_THRESHOLD = 3
const ATTACKS = [ "stomp"]

var idleCount = 0

@onready var animTree = get_node("AnimationTree")

func _init():
	MAX_HEALTH=16
	deathEffect=preload("res://Scenes/UI/BoomEffect.tscn")

func _ready():
	health=MAX_HEALTH
	SCALE=$Sprite2D.scale.x
	randomize()
	animTree.set_active(true)

func increase_count():
	idleCount+=1
	if idleCount > ATTACK_THRESHOLD:
		idleCount=0
		attack()

func attack():
	var attack = ATTACKS[randi_range(0, ATTACKS.size()-1)]
	animTree.set_condition(attack, true)

func _on_screen_visible():
	animTree.set_condition("on_screen", true)
	start_bossfight.emit()

func take_damage(amount: int):
	health-=amount
	animation.play("hit")
	if health<=0:
		emit_signal("enemy_death")

func _on_enemy_death():
	spawn_effect(deathEffect, position)
	queue_free()
