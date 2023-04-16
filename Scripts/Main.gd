extends Node

@export var enemyScene:PackedScene

func spawn_enemy_scientist():
	var spawnLocation = $ScientistSpawn
	var enemy = enemyScene.instantiate()
	$YSort.add_child(enemy)
	enemy.position = spawnLocation.position
	


func _on_start_game():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	spawn_enemy_scientist()
