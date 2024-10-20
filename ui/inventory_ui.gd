extends PanelContainer

@onready var h_box_container: HBoxContainer = $HBoxContainer

const INVENTORY_ITEM_UI = preload("res://ui/inventory_item_ui.tscn")

func add_item(type:Item.ItemType, texture:CompressedTexture2D, quantity:int):
	var node_name = "inventory_item_" + str(type)
	if not h_box_container.has_node(node_name):
		var inventory_item = INVENTORY_ITEM_UI.instantiate()
		inventory_item.name = node_name
		inventory_item.initialize(texture, quantity)
		h_box_container.add_child(inventory_item)
	else:
		var existing_node = h_box_container.get_node(node_name)
		existing_node.set_quantity(quantity)

func _on_inventory_item_added(item: Item, quantity:int) -> void:
	add_item(item.type, item.get_texture(), quantity)
