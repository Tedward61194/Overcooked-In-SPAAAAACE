class_name PlacementSlot extends Node3D

@export var accept_list = [] # Empty list can accept any item
var room = true

func try_put_down(obj) -> bool:
	if accept_list.is_empty():
		if room:
			# TODO: place obj above owner
			return true
		return false
	# TODO: check if obj is in list
	return false
