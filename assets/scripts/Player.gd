extends CharacterBody3D

# constants
const SPEED := 5.0

# config
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# refs
#var reach : RayCast3D = $Pivot/MeshInstance3d/Reach

# logic
#var looking_at = null

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


#func _process(delta):
#	var coll = reach.get_collider()
#
#	if coll != looking_at: # Looking at something new
#		if coll != null and "targeted" in coll:
#			coll.targeted = true
#		if looking_at != null and "targeted" in looking_at:
#			looking_at.targed = false
#
#		looking_at = coll


func _physics_process(delta) -> void:
	process_movement(delta)


func process_movement(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()