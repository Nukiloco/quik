class_name QuikUtil
extends Node

func _ready():
	get_tree().connect("node_added", self, '_node_added')

func _node_added(node: Node):
	node.connect('ready', self, '_node_ready', [node])

func _node_ready(node: Node):
	var ready_value = node.get('_quik_node_ready')
	if ready_value != null && ready_value == false:
		node.set('_quik_node_ready', true)

var wait_for_ready_array = []
func in_wait_for_ready_array(node: Node):
	for i in wait_for_ready_array:
		if i == node:
			return i
	return null

# wait for ready
func wfr(node: Node):
	var ready_value = node.get('_quik_node_ready')
	if ready_value != null:
		if ready_value:
			return yield()
	yield(node, 'ready')
