extends GutTest

var object_position_change_test_scene = preload("res://addons/quik/test/object_position_change_test.tscn")
var object_sprite_test_scene = preload("res://addons/quik/test/object_sprite_test.tscn")


func test_position():
	q.dv.p("test position", Vector2(500, 500), true)

func test_rect_position():
	q.dv.p("test rect position", Rect2(Vector2(100, 100), Vector2.ONE * 5))

func test_track_position():
	var new_object_position_change_test = object_position_change_test_scene.instance()
	new_object_position_change_test.position = Vector2(100, 100)
	get_node("/root").add_child(new_object_position_change_test)
	q.dv.tp(new_object_position_change_test, "visual object track test", Vector2.ONE * 5)

func test_sprite_track_position():
	var new_object_sprite_test = object_sprite_test_scene.instance()
	new_object_sprite_test.position = Vector2(250, 250)
	get_node("/root").add_child(new_object_sprite_test)
	q.dv.tp(new_object_sprite_test, "object sprite track test", Vector2.ONE * 5)
