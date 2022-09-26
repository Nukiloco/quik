extends GutTest

var object_position_change_test_scene = preload("res://addons/quik/test/object_position_change_test.tscn")
var object_sprite_test_scene = preload("res://addons/quik/test/object_sprite_test.tscn")


func test_position():
	q.v.lp("test position", Vector2(500, 500), true)

func test_rect_position():
	q.v.lp("test rect position", Rect2(Vector2(100, 100), Vector2.ONE * 5))

func test_position_track():
	var new_object_position_change_test = object_position_change_test_scene.instance()
	get_node("/root").add_child(new_object_position_change_test)
	q.v.lpt(new_object_position_change_test, "visual object track test", Vector2.ONE * 5)

func test_sprite_position_track():
	var object_sprite_test_scene = object_sprite_test_scene.instance()
	get_node("/root").add_child(object_sprite_test_scene)
	q.v.lpt(object_sprite_test_scene, "object sprite track test", Vector2.ONE * 5)
