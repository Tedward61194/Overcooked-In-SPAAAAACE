extends RefCounted
class_name RecipeData

var id : int
var obj_1 : int
var obj_2 : int
# I think placement slot only actually matters for processing, not recipes
#var placement_slot : int

func _init(_id:int, _obj_1:int, _obj_2:int):#, _placement_slot:int):
	id = _id
	obj_1 = _obj_1
	obj_2 = _obj_2
	#placement_slot = _placement_slot
