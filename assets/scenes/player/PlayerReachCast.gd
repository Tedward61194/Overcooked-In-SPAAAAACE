extends RayCast3D

var looking_at = null


func _process(delta):
	var col = get_collider()

	if col != looking_at:
		if col and col.mesh and "targeted" in col.mesh:
			col.mesh.targeted = true
		if looking_at != null and looking_at.mesh and "targeted" in looking_at.mesh:
			looking_at.mesh.targeted = false
			
		looking_at = col
