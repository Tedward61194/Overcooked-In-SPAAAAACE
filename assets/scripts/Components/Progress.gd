extends Node

# refs
@onready var prog_bar_graphic = $ProgressBar

# logic
var full : int = 100:
	get:
		return value
	set(val):
		full = val
		prog_bar_graphic.max_value = val
		
var value : int = 0:
	get:
		return value
	set(val):
		value = clamp(val, 0, full)
		prog_bar_graphic.value = val
		if value >= full:
			emit_signal("progress_completed")
