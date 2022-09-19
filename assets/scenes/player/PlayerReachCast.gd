extends RayCast3D

var looking_at = null


func _process(delta):
	var col = get_collider()
	
#	if col:
#		if col is GridMap:
#			looking_at = get_grid_map_target(col)w
#		else:
#			pass

	if col != looking_at: # Looking at something new
		if col != null and "targeted" in col:
			col.targeted = true
		if looking_at != null and "targeted" in looking_at:
			looking_at.targeted = false

		looking_at = col

func get_grid_map_target(gridmap : GridMap) -> Node3D:
	var pos : Vector3 = gridmap.world_to_map(gridmap.position)
	var index = gridmap.get_cell_item(pos)
	var type_name = str(gridmap.mesh_library.get_item_name(index))
	return gridmap#(index) # return correct value
	# TODO: Decide if I want to move away from gridmap
	#https://godotengine.org/qa/63759/how-to-access-mesh-instance-specific-location-from-gridmap
