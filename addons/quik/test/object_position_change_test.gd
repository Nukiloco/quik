extends Node2D

export var amount = 10
export var distance = 1
export var speed = 1

var current_rotate_amount = deg2rad(0)
func _process(delta: float) -> void:
	current_rotate_amount += speed * delta
	position.x += cos(current_rotate_amount) * distance
	position.y += sin(current_rotate_amount) * distance
