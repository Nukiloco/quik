extends Node

var random_value = 0

func _ready():
	pass

func _process(delta):
	random_value = randi() % 100
