class_name Quik
extends Node

onready var _is_ready = true
onready var _debug_log_node = find_node("DebugLog")
onready var _visual_debug_node = find_node("VisualDebug")

var d = null setget set_d, get_d

# test only
func _ready():
	pass

func set_d(val):
	d = val

func get_d() -> DebugLog:
	if !_is_ready:
		yield(self, "ready")
	return _debug_log_node

var v = null setget set_v, get_v
func set_v(val):
	v = val

func get_v() -> VisualDebug:
	if !_is_ready:
		yield(self, "ready")
	return _visual_debug_node
