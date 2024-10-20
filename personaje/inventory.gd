extends Area2D

signal item_added(item:Item, quantity:int)

## inventario, ej.
## {
## 		Shield = 3,
##		Sword = 1
## }
var inventory = {}

func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	if area is Item:
		add_item_to_inventory(area)
		area.collect_item()
		
func add_item_to_inventory(item:Item):
	if not inventory.has(item.type):
		inventory[item.type] = 1
	else:
		inventory[item.type] = inventory[item.type] + 1
	item_added.emit(item, inventory[item.type])
	prints("añadido al inventario objeto de tipo", Item.ItemType.keys()[item.type], "ahora tenemos:", inventory[item.type])
		
