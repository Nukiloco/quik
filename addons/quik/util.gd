class_name QuikUtil
extends Node

# This feature doesn't work because set() does not set properties that doesn't exist
# There is also no property on nodes for when they are ready, so this is impossible to do currently without impacting
# performance negatively

# func _enter_tree():
# 	get_tree().connect("node_added", self, '_node_added')

# func _node_added(node: Node):
# 	add_to_wait_list(node)
# 	node.connect('ready', self, '_node_ready', [node])

# func _node_ready(node: Node):
# 	var ready_node = get_from_wait_list(node)
# 	if ready_node:
# 		ready_node.set('_quik_node_ready', true)

# var wfr_array = []

# func add_to_wait_list(node: Node):
# 	var node_in_wait_list = get_from_wait_list(node)
# 	if node_in_wait_list == null:
# 		print('add | node passing through %s | node in wait list %s' % [node, node_in_wait_list])
# 		wfr_array.append(node)
# 		return node
# 	return node_in_wait_list

# func get_from_wait_list(node: Node):
# 	for i in wfr_array:
# 		if i == node:
# 			return i
# 	return null

# # wait for ready
# func wfr(node: Node):
# 	var ready_property = node.get('_quik_node_ready')
# 	if ready_property == null:
# 		var ready_node = add_to_wait_list(node)
# 		if ready_node != null:
# 			return yield(node, 'ready')
# 	else:
# 		if ready_property == false:
# 			return yield(node, 'ready')
# 		else:
# 			return yield()