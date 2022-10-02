extends RefCounted
class_name ObjectDB


enum {GREEN_CUBE, BLUE_CUBE, YELLOW_CUBE}

# Dictionaries
var name = {
	GREEN_CUBE: "GreenCube",
	BLUE_CUBE: "BlueCube",
	YELLOW_CUBE: "YellowCube"
}


var data = {}


func _init():
	_add_obj_data(GREEN_CUBE)


func _add_obj_data(id : int):
	data[id] = ObjectData.new(id, name[id])
