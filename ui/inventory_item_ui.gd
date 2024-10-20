class_name InventoryItemUI extends Panel

func initialize(texture:CompressedTexture2D, quantity:int):
	$TextureRect.texture = texture
	$Label.text = str(quantity)
	
func set_quantity(quantity:int):
	$Label.text = str(quantity)
