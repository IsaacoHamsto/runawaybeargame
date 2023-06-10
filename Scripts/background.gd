extends Node2D

@onready var Camera = get_node("../YSort/Character/Camera2D")

func _ready():
	$Lab.hide()
	$Forest.hide()
	$City.hide()
	
	$Lab/StaticBody2D/LabWallShape.set_deferred("disabled", true)
	$Forest/StaticBody2D2/ForestWallShape.set_deferred("disabled", true)
	$City/WallTop/CityWallTopShape.set_deferred("disabled", true)
	$City/BorderWall/CityBorderWallShape.set_deferred("disabled", true)

func _level_one():
	$Lab.show()
	$Lab/StaticBody2D/LabWallShape.set_deferred("disabled", false)
	Camera.limit_right = $Lab/Lab3.position.x + $Lab/Lab3.scale.x * 540

func _level_two():
	$Forest.show()
	$Forest/StaticBody2D2/ForestWallShape.set_deferred("disabled", false)
	Camera.limit_right = $Forest/Forest3.position.x + $Forest/Forest3.scale.x * 262

func _level_three():
	$City.show()
	$City/WallTop/CityWallTopShape.set_deferred("disabled", false)
	$City/BorderWall/CityBorderWallShape.set_deferred("disabled", false)
	Camera.limit_right = $City/City3.position.x + $City/City3.scale.x * 540
