extends RefCounted

class_name PickupDB

enum {GREEN_CUBE}


var pick_up_scene = {
	GREEN_CUBE: load("res://assets/scenes/pickedups/GreenCube_Pickedup.tscn"),
}

var put_down_scene = {
	GREEN_CUBE: load("res://assets/scenes/prototype_blocks/GreenCube.tscn")
}

var data = {}

func _init():
	_add_obj_data(GREEN_CUBE)

func _add_obj_data(pickup_enum : int):
	data[pickup_enum] = PickupableData.new(pickup_enum, pick_up_scene[pickup_enum], put_down_scene[pickup_enum])
