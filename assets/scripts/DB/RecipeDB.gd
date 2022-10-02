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


# This isn't super efficient. If I have problems, consider another rout, like using c#/linq?
func search_by_data(obj_1:int,obj_2:int, placement_slot:int) -> int:
	for recipe in data.values():
		if recipe["placement_slot"] == placement_slot:
			if recipe["obj_1"] == obj_1:
				if recipe["obj_2"] == obj_2:
					return recipe
			if recipe["obj_1"] == obj_2:
				if recipe["obj_2"] == obj_1:
					recipe
	return -1 # Recipe not found
