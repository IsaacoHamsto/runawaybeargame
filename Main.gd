extends Node

@export var enemyScene:PackedScene

func spawn_enemy_scientist():
	var spawnLocation
	var enemy = enemyScene.instance()
	add_child(enemy)
	
