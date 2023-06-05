class_name HurtBox
extends Area2D


func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(hitbox: HitBox):
	if hitbox == null: return
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
