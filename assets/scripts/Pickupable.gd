extends Node3D

# refs
@onready var root : RigidBody3D = self.get_parent()
var pick_up_position_node : Node3D

# logic
var picked_up = false


func _physics_process(delta):
	if picked_up and pick_up_position_node:
		root.position = pick_up_position_node.global_position


func pickup(handPosition : Node3D):
	picked_up = true
	pick_up_position_node = handPosition
