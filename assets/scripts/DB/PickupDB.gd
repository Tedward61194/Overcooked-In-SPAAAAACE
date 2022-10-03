extends RefCounted

class_name PickupDB

enum {GREEN_CUBE, BLUE_CUBE, YELLOW_CUBE, RED_CUBE}


var pick_up_scene = {
	GREEN_CUBE: load("res://assets/scenes/pickedups/GreenCube_Pickedup.tscn"),
	BLUE_CUBE: load("res://assets/scenes/pickedups/BlueCube_Pickedup.tscn"),
	YELLOW_CUBE: load("res://assets/scenes/pickedups/YellowCube_Pickedup.tscn"),
	RED_CUBE: load("res://assets/scenes/pickedups/RedCube_Pickedup.tscn")
}

var put_down_scene = {
	GREEN_CUBE: load("res://assets/scenes/prototype_blocks/GreenCube.tscn"),
	BLUE_CUBE: load("res://assets/scenes/prototype_blocks/BlueCube.tscn"),
	YELLOW_CUBE: load("res://assets/scenes/prototype_blocks/YellowCube.tscn"),
	RED_CUBE: load("res://assets/scenes/prototype_blocks/RedCube.tscn")
}

var data = {}

func _init():
	_add_obj_data(GREEN_CUBE)
	_add_obj_data(BLUE_CUBE)
	_add_obj_data(YELLOW_CUBE)
	_add_obj_data(RED_CUBE)

func _add_obj_data(pickup_id : int):
	data[pickup_id] = PickupableData.new(pickup_id, pick_up_scene[pickup_id], put_down_scene[pickup_id])
