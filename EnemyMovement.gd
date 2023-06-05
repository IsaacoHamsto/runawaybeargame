class_name EnemyMovement
extends Node

var SPEED:float
var RANGE:float
var DEPTH=.7
var newVelocity:Vector2

func set_enemy_velocity(position:Vector2, target:Node2D):
	newVelocity = position.direction_to(target.position) * SPEED
	newVelocity.y = newVelocity.y*DEPTH
	return newVelocity
