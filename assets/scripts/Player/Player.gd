extends CharacterBody3D

# constants
const SPEED := 5.0

# config
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# ref
@onready var pick_up_position := $Pivot/BodyMesh/Hand/PickUpPosition
@onready var hand_reach_ray := $Pivot/BodyMesh/HandsReach
@onready var feet_reach_ray := $Pivot/BodyMesh/FeetReach


# logic
var obj_in_hands : int = -1
var hand_looking_at


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta) -> void:
	process_movement(delta)


func _process(_delta):
	check_hand_reach_ray()


func _input(_event):
	if Input.is_action_just_pressed("PickUp"):
		pick_up_put_down()
	elif Input.is_action_pressed("Interact"):
		start_interact()
	elif Input.is_action_just_released("Interact"):
		end_interact()


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



func check_hand_reach_ray():
	# Look for hilightable node in front of player
	# If found highlight it
	# Update hand_looking_at
	var col = hand_reach_ray.get_collider()
	if col != hand_looking_at:
		if col and col.has_node("Highlightable"):
			col.get_node("Highlightable").targeted = true
		if hand_looking_at != null and hand_looking_at.has_node("Highlightable"):
			hand_looking_at.get_node("Highlightable").targeted = false
		hand_looking_at = col


func pick_up_put_down():
	if obj_in_hands == -1: # Hands empty. Try pick up
		if hand_looking_at != null and hand_looking_at.has_node("Pickupable"):
			obj_in_hands = hand_looking_at.get_node("Pickupable").pickup(pick_up_position)
	else: # Try put down
		var col = feet_reach_ray.get_collider()
		if col != null and col.has_node("PlacementSlot"):
			var put_down = col.get_node("PlacementSlot").try_put_down(obj_in_hands)
			if put_down:
				obj_in_hands = -1
				pick_up_position.get_child(0).queue_free() # pickup method attached obj as child


func start_interact():
	if obj_in_hands == -1: # Hands are empty
		if hand_looking_at != null and hand_looking_at.has_node("Interactable"): # Do I want to just check progress node? Fine for now
			hand_looking_at.get_node("Interactable").start_interacting()
			

func end_interact():
	if hand_looking_at != null and hand_looking_at.has_node("Interactable"): # Do I want to just check progress node? Fine for now
		hand_looking_at.get_node("Interactable").stop_interacting()
