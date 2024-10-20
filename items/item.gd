@tool
class_name Item extends Area2D

enum ItemType { SHIELD, KEY, SWORD }

@export var type:ItemType
@export var texture:CompressedTexture2D:
	set(value):
		texture = value
		$Sprite2D.texture = value

func collect_item():
	queue_free()
	
func get_texture() -> CompressedTexture2D:
	return texture
