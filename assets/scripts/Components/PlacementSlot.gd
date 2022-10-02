class_name PlacementSlot extends Node3D

@export var placement_slot_id : int
@export var accept_list = [] # Empty list can accept any item
var holding = []

func try_put_down(obj_in_hands : int) -> bool:
	# Pick object to spawn
	var processed_id = pick_obj_to_place(obj_in_hands)
	# Create new instance of obj 1 block above self
	place_object(processed_id)
	#TODO: Update accept_list
	# TODO: check if obj is in list
	return processed_id != -1


func pick_obj_to_place(obj_in_hands:int) -> int:
	var processed_obj_id = -1
	# Process Placement slot transformation
	if accept_list.is_empty(): # Implies holding is empty and anything can be placed
		processed_obj_id = obj_in_hands
	elif accept_list.has(obj_in_hands):
		processed_obj_id = DB.recipe_db.search_by_data(1,2,0) #TODO: dont hardcode
		
	# TODO: Process recipe transformation
	
	return processed_obj_id


func place_object(obj_id : int):
	var obj_to_place = DB.pickup_db.data[obj_id].put_down_scene.instantiate()
	self.add_child(obj_to_place)
	obj_to_place.set_global_position(Vector3( \
		self.get_global_position().x, \
		self.get_global_position().y + 1, \
		self.get_global_position().z))
	holding.append(obj_id)
