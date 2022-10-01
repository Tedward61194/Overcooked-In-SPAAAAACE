#extends Node
extends Node3D

# signals
signal progress_finished()

# refs
@onready var prog_bar_graphic = $SubViewport/ProgressBar

# logic
@onready var is_interacting = false:
	set(val):
		is_interacting = val
		on_is_interacting_changed()
		
@export var work_speed = 50
@export var interval = 0.2

@export var full : int = 100:
	get:
		return full
	set(val):
		full = val
		prog_bar_graphic.max_value = val
#
var value : int = 0:
	get:
		return value
	set(val):
		value = val
		prog_bar_graphic.value = val


func on_is_interacting_changed():
	visible = true # Do I want to turn this off when interaction stops?
	if is_interacting:
		interact()
	else:
		pass


func interact():
	if (value < full):
		if is_interacting:
			var tween = create_tween()
			tween.tween_property(self, 'value', value + (work_speed * interval), interval)
			tween.tween_callback(interact)
			# TODO: Can I cut tween off imediatly when button released
	else:
		emit_signal("progress_finished")
