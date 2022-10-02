extends RefCounted
class_name RecipeDB


enum {GREEN_CUBE}

# Dictionaries
# TODO: Make Object DB
var obj_1 = {
	GREEN_CUBE: 1 # Blue Cube
}


var obj_2 = {
	GREEN_CUBE: 2 # Yellow Cube
}


var placement_slot = {
	GREEN_CUBE: 0 # Med Gray Cube
}


var data = {}


func _init():
	_add_obj_data(GREEN_CUBE)


func _add_obj_data(id : int):
	data[id] = RecipeData.new(id, obj_1[id],obj_2[id], placement_slot[id])
