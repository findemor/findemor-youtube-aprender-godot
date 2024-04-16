extends CanvasLayer

const LEVEL_1_FILE = "res://niveles/level_1.tscn"

func set_title(title):
	$VBoxContainer/Label.text = title

func _on_button_button_down():
	get_tree().change_scene_to_file(LEVEL_1_FILE)
