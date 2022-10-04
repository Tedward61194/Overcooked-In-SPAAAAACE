extends Node3D

# signals
signal progress_finished

# refs
@onready var prog_bar = $ProgressBar3D
@export var interaction_locations : PackedInt32Array = []
var held_by_index : int = -1

# logic
var is_interacting = false:
	set(val):
		is_interacting = val
		prog_bar.is_interacting = val


func _ready():
	prog_bar.connect("progress_finished", _on_progress_finished)


func start_interacting(): 
	var held_by = get_parent().get_parent() # should be placement slot
	if interaction_locations.has(held_by.placement_slot_id):
		held_by_index = held_by.placement_slot_id
		if !is_interacting:
			is_interacting = true

func stop_interacting():
	if is_interacting:
		is_interacting = false


func _on_progress_finished():
	emit_signal("progress_finished", held_by_index)
