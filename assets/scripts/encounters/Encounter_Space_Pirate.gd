extends Node

@onready var pirate_ship : PackedScene = load("res://assets/scenes/enemy_ships/Space_Pirate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_pirate_ship = pirate_ship.instantiate()
	add_child(new_pirate_ship)
