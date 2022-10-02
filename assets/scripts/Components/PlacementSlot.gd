class_name PlacementSlot extends Node3D

# refs
@onready var holding_ray := $RayCast3d

@export var placement_slot_id : int
@export var accept_list = [] # Empty list can accept any item
#var holding = -1

func try_put_down(obj_in_hands : int) -> bool:
	# Pick object to spawn
	var processed_id = pick_obj_to_place(obj_in_hands)
	# Create new instance of obj 1 block above self
	if processed_id != -1:
		place_object(processed_id)
	#TODO: Update accept_list
	# TODO: check if obj is in list
	return processed_id != -1


func pick_obj_to_place(obj_in_hands:int) -> int:
	var processed_obj_id = -1
	var holding_id = get_holding_id()
	# Process Placement slot transformation
	if accept_list.is_empty() && holding_id == -1:
		processed_obj_id = obj_in_hands
	# TODO: Null holding but non-empty accept list
	else:
		#Process recipe transformation
		processed_obj_id = DB.recipe_db.search_by_data(holding_id,obj_in_hands,placement_slot_id)
		if processed_obj_id != -1 and holding_id != -1:
			destroy_object_being_held()
	return processed_obj_id


func get_holding_id(): # Could be more performant to store holding?
	var col = holding_ray.get_collider()
	if col and col.has_node("Pickupable"):
		return col.get_node("Pickupable").id
	return -1


func destroy_object_being_held():
	holding_ray.get_collider().queue_free()


func place_object(obj_id : int):
	var new_obj = DB.pickup_db.data[obj_id].put_down_scene.instantiate()
	self.add_child(new_obj)
	new_obj.set_global_position(Vector3( \
		self.get_global_position().x, \
		self.get_global_position().y + 1, \
		self.get_global_position().z))
#	holding = obj_id
