extends Node2D

func _process(delta):
	var random_value = randi() % 100 
	global_position = Vector2(random_value, random_value)
