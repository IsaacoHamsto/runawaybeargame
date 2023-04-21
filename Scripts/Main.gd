extends Node

@export var scientistScene:PackedScene
@export var willsmithScene:PackedScene

func spawn_enemy(spawnLocation: Vector2, enemyScene: PackedScene):
	var enemyNode = enemyScene.instantiate()
	$YSort.add_child(enemyNode)
	enemyNode.position = spawnLocation

func _on_game_over():
	get_tree().call_group("enemies", "queue_free")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_game():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	spawn_enemy($ScientistSpawn.position, willsmithScene)
	spawn_enemy(Vector2(1500, 700), scientistScene)
