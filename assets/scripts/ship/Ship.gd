extends Node

@export var hull : int
@export var shields : int
@export var missiles : int

# refs
@onready var hull_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/HullLabel
@onready var shields_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/ShieldsLabel
@onready var missiles_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/MissilesLabel
@onready var enemy_ship_info = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/EnemyShipInfo

func _ready():
	hull_label.text = "Hull Integrity: " + str(hull)
	shields_label.text = "Shields: " + str(shields)
	missiles_label.text = "Missiles: " + str(missiles)
	
	Events.connect("enemy_missile_shot", on_enemy_missile_shot)


func on_enemy_missile_shot(warning_message:String, travel_time):
	print(warning_message + str(travel_time))
