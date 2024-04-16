class_name Boss
extends Node2D

@onready var animation_player = $AnimationPlayer
const ESCENA_BARRIL = preload("res://enemigos/barril.tscn")

func _ready():
	$Timer.connect("timeout", _on_timer_timeout)
	
func launch_barrel():
	var instancia_barril = ESCENA_BARRIL.instantiate()
	instancia_barril.position = $CharacterSquareRed/CharacterHandRed.position
	add_child(instancia_barril)
	animation_player.play("reposo")

func _on_timer_timeout():
	animation_player.play("lanzar")
	$Timer.wait_time = randf_range(2, 5)
