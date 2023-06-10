extends Node

var level
@onready var music = get_node("Music")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	for i in get_children():
		if i.get_class()=="Marker2D":
			spawn_enemy(i.position, i.Enemy)
	

func spawn_enemy(spawnLocation: Vector2, enemyScene: PackedScene):
	var enemyNode = enemyScene.instantiate()
	$YSort.add_child(enemyNode)
	enemyNode.position = spawnLocation

func _on_gameOver():
	#get_tree().call_group("enemies", "queue_free")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _level_one():
	level=1

func _level_two():
	level=2

func _level_three():
	level=3
