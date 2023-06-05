class_name Enemy
extends CharacterBody2D

signal enemy_death

enum State {
	Walking,
	Attacking,
	Staggering
}

@export var SPEED:float
@export var MAX_HEALTH:int
var SCALE

var health:int
var inRange:bool

@onready var current_state = State.Walking

@onready var player = get_parent().get_node("Character")
@onready var animation = get_node("AnimationPlayer")
@onready var sprite = get_node("Sprite2D")
@onready var rangeArea = get_node("RangeArea")

func follow_player():
	velocity = position.direction_to(player.get("position")) * SPEED
	move_and_slide()

func take_damage(amount: int):
	health-=amount
	_change_state(State.Staggering)
	if health<=0:
		emit_signal("enemy_death")

func _change_state(new_state):
	current_state=new_state
	match current_state:
		State.Walking:
			animation.play("walk")
		State.Attacking:
			animation.play("attack")
		State.Staggering:
			animation.play("hit")

func _draw():
	sprite.scale.x = -SCALE if position.x < player.position.x else SCALE

func _on_enemy_death():
	if animation.current_animation == "hit":
		await animation.animation_finished
	queue_free()
