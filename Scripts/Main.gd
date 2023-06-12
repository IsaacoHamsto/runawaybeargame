extends Node

var level
@onready var music = get_node("Music")

func _ready():
	get_tree().paused = true
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	for i in get_children():
		if i.get_class()=="Marker2D":
			spawn_enemy(i.position, i.Enemy)
	

func spawn_enemy(spawnLocation: Vector2, enemyScene: PackedScene):
	var enemyNode = enemyScene.instantiate()
	$YSort.add_child(enemyNode)
	enemyNode.position = spawnLocation

func _on_gameOver():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _level_one():
	level=1

func _level_two():
	level=2

func _level_three():
	level=3

func _on_bossfight():
	$Music.stop()
	$BossMusic.play()

func _on_boss_end():
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().change_scene_to_file("res://Scenes/UI/Cutscene_end.tscn")
