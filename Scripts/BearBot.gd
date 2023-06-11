extends Enemy

@onready var meeleeRange = get_node("MeeleeRangeArea")
@onready var rangedRange = get_node("RangedRangeArea")

func _init():
	SPEED=140
	MAX_HEALTH=10

func _ready():
	health=MAX_HEALTH
	meeleeRange.area_entered.connect()
	meeleeRange.area_exited.connect()
	rangedRange.area_entered.connect()
	rangedRange.area_exited.connect()
	SCALE=$Sprite2D.scale.x
