extends RefCounted
class_name RecipeData

var recipe_id : int
var obj_1 : int
var obj_2 : int
var placement_slot : int

func _init(_recipe_id:int, _obj_1:int, _obj_2:int, _placement_slot:int):
	recipe_id = _recipe_id
	obj_1 = _obj_1
	obj_2 = _obj_2
	placement_slot = _placement_slot
