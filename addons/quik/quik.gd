class_name Quik
extends Node

onready var _is_ready = true
onready var _debug_log_node = find_node("DebugLog")
onready var _debug_visual_node = find_node("DebugVisual")
onready var _util_node = find_node('Util')

# Debug Log
var d = null setget set_d, get_d

func set_d(val):
	d = val

func get_d() -> QuikDebugLog:
	if !_is_ready:
		yield(self, "ready")
	return _debug_log_node

# Debug Visual
var dv = null setget set_dv, get_dv
func set_dv(val):
	dv = val

func get_dv() -> QuikDebugVisual:
	if !_is_ready:
		yield(self, "ready")
	return _debug_visual_node

# Util
var u = null setget set_u, get_u
func set_u(val):
	u = val

func get_u() -> QuikUtil:
	if !_is_ready:
		yield(self, "ready")
	return _debug_visual_node