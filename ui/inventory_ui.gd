extends PanelContainer

signal inventory_item_ui_selected(item_type:Item.ItemType)

@onready var h_box_container: HBoxContainer = $HBoxContainer

const INVENTORY_ITEM_UI = preload("res://ui/inventory_item_ui.tscn")

func add_item(type:Item.ItemType, texture:CompressedTexture2D, quantity:int):
	var node_name = "inventory_item_" + str(type)
	if not h_box_container.has_node(node_name):
		var inventory_item = INVENTORY_ITEM_UI.instantiate()
		inventory_item.name = node_name
		inventory_item.initialize(type, texture, quantity)
		inventory_item.connect("inventory_item_used", _on_inventory_item_used)
		h_box_container.add_child(inventory_item)
	else:
		var existing_node = h_box_container.get_node(node_name)
		existing_node.set_quantity(quantity)

func _on_inventory_item_added(item: Item, quantity:int) -> void:
	add_item(item.type, item.get_texture(), quantity)


func _on_inventory_item_consumed(item_type: Item.ItemType, quantity_left: int) -> void:
	var node_name = "inventory_item_" + str(item_type)
	if h_box_container.has_node(node_name):
		var existing_node = h_box_container.get_node(node_name)
		if quantity_left > 0:
			existing_node.set_quantity(quantity_left)
		else:
			existing_node.queue_free()
			
func _on_inventory_item_used(item_type:Item.ItemType):
	inventory_item_ui_selected.emit(item_type)
