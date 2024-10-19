extends Area2D


func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	area.queue_free()
