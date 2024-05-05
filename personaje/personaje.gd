class_name Personaje
extends CharacterBody2D

signal player_hit()

@export var gravity = 100
@export var jump_speed = 100
@export var speed = 100
@onready var sprite_2d = $Sprite2D


func _physics_process(delta):
	
	#horizontal
	var direction = Input.get_axis("izquierda", "derecha")
	velocity.x = speed * direction
	
	if direction != 0:
		sprite_2d.scale.x = direction
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#saltar
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed and is_on_floor():
		velocity.y = velocity.y - jump_speed
	
	move_and_slide()
	
	check_barril_hit()

func check_barril_hit():
	#fix de los barriles chocando con el personaje
	var last_collisions:KinematicCollision2D = get_last_slide_collision()
	if last_collisions:
		var collider_node = last_collisions.get_collider()
		if collider_node is Barril:
			if collider_node.can_damage():
				damage_received()
				collider_node.set_damage_done()

func _on_area_2d_body_entered(body):
	print("Un cuerpo ha entrado en el área: ", body.name)
	print("aqui podriamos reproducir una animación de alegria")
	
func damage_received():
	print("daño recibido")
	player_hit.emit()
