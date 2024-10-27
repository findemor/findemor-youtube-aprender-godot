class_name InventoryItemUI extends Panel

signal inventory_item_used(item_type:Item.ItemType)

var item_type:Item.ItemType

func initialize(type:Item.ItemType, texture:CompressedTexture2D, quantity:int):
	item_type = type
	$TextureRect.texture = texture
	$Label.text = str(quantity)
	
func set_quantity(quantity:int):
	$Label.text = str(quantity)

var mouse_over:bool = false

func _on_mouse_entered() -> void:
	mouse_over = true
	var tween = get_tree().create_tween()
	tween.bind_node(self)
	tween.tween_property($NinePatchRect, "modulate", Color("#9b7aff"), 0.3)

func _on_mouse_exited() -> void:
	mouse_over = false
	var tween = get_tree().create_tween()
	tween.bind_node(self)
	tween.tween_property($NinePatchRect, "modulate", Color.WHITE, 0.3)
	
func _input(event):
	if event is InputEventMouseButton and event.is_released():
		if mouse_over:
			inventory_item_used.emit(item_type)
