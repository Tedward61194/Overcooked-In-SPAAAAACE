extends Node3D
class_name Pickupable

# refs
@onready var root : RigidBody3D = self.get_parent()
var id : int
var pick_up_scene : PackedScene
var put_down_scene : PackedScene


func _ready():
	id = DB.pickup_db.data[PickupDB.GREEN_CUBE].pickup_enum
	pick_up_scene = DB.pickup_db.data[PickupDB.GREEN_CUBE].pick_up_scene
	put_down_scene = DB.pickup_db.data[PickupDB.GREEN_CUBE].put_down_scene


func pickup(handPosition : Node3D) -> int:
	if pick_up_scene:
		var instance = pick_up_scene.instantiate()
		handPosition.add_child(instance)
		instance.set_global_position(handPosition.get_global_position())
		root.queue_free()
		return id
	push_error("Failed to get pick_up_scene")
	return -1
