extends GutTest

var object_value_change_test_scene = preload("res://addons/quik/test/object_value_change_test.tscn")

func test_log():
	q.d.l('test!', 'hello')

func test_track():
	var new_object_value_change_test = object_value_change_test_scene.instance()
	get_node("/root").add_child(new_object_value_change_test)
	yield(get_tree().create_timer(1), "timeout")
	q.d.t(new_object_value_change_test, "random_value")
