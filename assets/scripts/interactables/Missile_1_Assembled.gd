extends RigidBody3D

# refs
@onready var interactable = $Interactable
@onready var collision_shape = $CollisionShape3d
@onready var missile : PackedScene = load("res://assets/scenes/interactables/Missile.tscn")


func _ready():
	interactable.connect("progress_finished", _on_progress_finished)
	#TODO: Figure out a way to destroy self to make room for swap


func _on_progress_finished(held_by_index):
	if held_by_index == 1: # TODO: Should probably set this to a recipe.
		# Turn off collisions and gravity so we can spawn another object
		# at this position without it falling through the floor
		set_gravity_scale(0)
		collision_shape.disabled = true
		var new_missile = missile.instantiate()
		get_parent().add_child(new_missile) # add_sibling()?
		new_missile.set_global_position(self.get_global_position())
		queue_free()

