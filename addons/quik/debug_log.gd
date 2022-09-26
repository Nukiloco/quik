class_name DebugLog
extends Node

onready var label_node = find_node("Label")

var storage = {}
var node_track = {}

func get_pretty_log_string():
	var out = ""
	for i in storage.size():
		var key = storage.keys()[i]
		var value = storage.values()[i]
		var line_break = ""
		if i != storage.size():
			line_break = "\n"
		out += "%s: %s%s" % [key, value, line_break]
	return out

func set_label_text(text):
	if label_node:
		label_node.text = text

var should_update_text = false
func _process(delta):
	process_node_track(delta)
	if should_update_text:
		should_update_text = false
		set_label_text(get_pretty_log_string())

func process_node_track(delta):
	if node_track.size() > 0:
		for key in node_track:
			var node_ref = node_track[key]
			var value = node_ref.get(key)
			storage["(%s) %s" % [node_ref.name, key]] = value
		should_update_text = true

func lt(node_ref, var_name):
	node_track[var_name] = node_ref

func l(var_name, var_value):
	storage[var_name] = var_value
	should_update_text = true
