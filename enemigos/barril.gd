class_name Barril
extends RigidBody2D

const BARREL_RED = preload("res://assets/kenney/enemies/barrel_red.png")
@export var demasiado_abajo = 1000
var damage_done = false

func _process(delta):
	if position.y > demasiado_abajo:
		queue_free()


func _on_body_entered(body):
	pass
	#comento porque lo reemplazo por la funcion check_barril_hit en la clase jugador
	#if body is Personaje:
		#if not damage_done:
			#print("Jugador herido")
			#damage_done = true
			#$BarrelYellow.texture = BARREL_RED
			#if body.has_method("damage_received"):
				#body.damage_received()
				
func set_damage_done() -> void:
	damage_done = true
	$BarrelYellow.texture = BARREL_RED

func can_damage() -> bool:
	return not damage_done
