tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton('q', 'res://addons/quik/quik.tscn')

func _exit_tree():
	remove_autoload_singleton('q')
