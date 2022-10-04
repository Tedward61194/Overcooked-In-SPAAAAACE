extends Node3D

# signals
signal progress_finished()

# refs
@onready var prog_bar = $ProgressBar3D

# logic
var is_interacting = false:
	set(val):
		is_interacting = val
		prog_bar.is_interacting = val


func _ready():
	prog_bar.connect("progress_finished", _on_progress_finished)


func start_interacting():
	if !is_interacting:
		is_interacting = true

func stop_interacting():
	if is_interacting:
		is_interacting = false


func _on_progress_finished():
	emit_signal("progress_finished")
