class_name Item extends Area2D

enum ItemType { SHIELD, KEY, SWORD }

@export var type:ItemType


func collect_item():
	queue_free()
