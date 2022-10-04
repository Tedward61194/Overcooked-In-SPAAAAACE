extends Node

@export var hull : int
@export var shields : int
@export var missiles : int

# refs
@onready var hull_label = $CanvasLayer/UI/HBoxContainer/HullLabel
@onready var shields_label = $CanvasLayer/UI/HBoxContainer/ShieldsLabel
@onready var missiles_label = $CanvasLayer/UI/HBoxContainer/MissilesLabel

func _ready():
	hull_label.text = "Hull Integrity: " + str(hull)
	shields_label.text = "Shields: " + str(shields)
	missiles_label.text = "Missiles: " + str(missiles)
