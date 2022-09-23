extends RayCast3D

var looking_at = null


func _process(delta):
	var col = get_collider()

	if col != looking_at:
		if col and col.has_node("Highlightable"):
				col.get_node("Highlightable").targeted = true
		if looking_at and looking_at.has_node("Highlightable"):
				looking_at.get_node("Highlightable").targeted = false
		looking_at = col

