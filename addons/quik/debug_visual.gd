class_name DebugVisual
extends Node2D

var rect_storage = {}
var rect_storage_node_track = {}
var default_font: Font = null

var should_update_visual = false
func _ready():
	default_font = Control.new().get_font('')

func _process(delta):
	process_rect_storage_node_track(delta)
	if should_update_visual:
		should_update_visual = false
		update()

func _draw():
	draw_rect_storage()

func draw_rect_storage():
	for key in rect_storage:
		var obj = rect_storage[key]
		var rect = obj.rect
		var pos = rect.position
		var size = rect.size
		var filled = obj.filled
		var width = obj.width
		var color = obj.color
		
		var new_rect = Rect2(pos, size)
		draw_rect(new_rect, color, filled, width)
		draw_string(default_font, Vector2(pos.x, pos.y + size.y + 10), key)

func process_rect_storage_node_track(delta):
	if rect_storage_node_track.size() > 0:
		for key in rect_storage_node_track:
			var tracked_node = rect_storage_node_track[key]
			var node_ref = tracked_node.get("node_ref")
			var rect_value = tracked_node.get("rect")
			var custom_size = tracked_node.get("custom_size")
			var width_value = tracked_node.get("width")
			var filled_value = tracked_node.get("filled")
			var color_value = tracked_node.get('color')
			
			var size_value = Vector2.ZERO * 5
			if custom_size != null:
				size_value = custom_size
			
			var position_value = null
			if node_ref is Node2D:
				position_value = node_ref.global_position
			elif node_ref is Control:
				position_value = node_ref.rect_global_position
				if custom_size != null:
					size_value = node_ref.rect_size
			
			if node_ref is Sprite:
				if custom_size == null:
					var texture_size = node_ref.texture.get_size()
					var new_size = texture_size * node_ref.scale
					size_value = new_size
			
			
			p(key, Rect2(position_value, size_value), filled_value, width_value)
		should_update_visual = true

# track node position
func tp(node_ref, var_name, width = 1, filled = true, color: Color = Color.green, custom_size = null):
	# prevent warning spam
	if filled:
		width = 1
	
	rect_storage_node_track[var_name] = {
		"node_ref": node_ref,
		"custom_size": custom_size,
		"rect": Rect2(Vector2.ZERO, Vector2.ZERO),
		'color': color,
		"width": width,
		"filled": filled
	}

# visual log position
func p(var_name, rect_or_pos = Rect2(Vector2.ZERO, Vector2.ONE * 5), width = 1, filled = true, color: Color = Color.green):
	if rect_or_pos is Vector2:
		rect_or_pos = Rect2(rect_or_pos, Vector2.ONE * 5)
	
	# prevent warning spam
	if filled:
		width = 1
	
	rect_storage[var_name] = {
		"rect": rect_or_pos,
		'color': color,
		"width": width,
		"filled": filled
	}
	should_update_visual = true
