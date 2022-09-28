class_name PlacementSlot extends Node3D

@export var accept_list = [] # Empty list can accept any item
var room = true

func try_put_down(obj_id : int) -> bool:
	if accept_list.is_empty():
		if room:
			# Place obj above owner
			var obj_to_place = DB.pickup_db.data[obj_id].put_down_scene.instantiate()
			self.add_child(obj_to_place)
			obj_to_place.set_global_position(Vector3( \
				self.get_global_position().x, \
				self.get_global_position().y + 1, \
				self.get_global_position().z))
			return true
		return false
	# TODO: check if obj is in list
	return false
