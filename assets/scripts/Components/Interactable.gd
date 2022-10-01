extends Node3D

# refs
@onready var prog_bar = $ProgressBar3D

# logic
var is_interacting = false:
	set(val):
		is_interacting = val
		prog_bar.is_interacting = val

func start_interacting():
	is_interacting = true

func stop_interacting():
	is_interacting = false
