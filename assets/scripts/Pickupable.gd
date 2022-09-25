class_name Pickupable extends Node3D

# refs
@onready var root : RigidBody3D = self.get_parent()
@export var id : int
@export var pickup_scene : PackedScene


func pickup(handPosition : Node3D):
	if pickup_scene:
		var inatance = pickup_scene.instantiate()
		handPosition.add_child(inatance)
		inatance.set_global_position(handPosition.get_global_position())
		root.queue_free()

