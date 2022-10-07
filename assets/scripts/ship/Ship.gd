extends Node

@export var hull : int
@export var shields : int
@export var missiles : int

# refs
@onready var hull_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/HullLabel
@onready var shields_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/ShieldsLabel
@onready var missiles_label = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/PlayerShipHud/MissilesLabel
@onready var enemy_ship_info = $Viewports/HUDContainer/SubViewport/HUD/VBoxContainer/EnemyShipInfo
@onready var countdown_alert : PackedScene = load("res://assets/scenes/ui/alerts/CountdownAlert.tscn")

func _ready():
	hull_label.text = "Hull Integrity: " + str(hull)
	shields_label.text = "Shields: " + str(shields)
	missiles_label.text = "Missiles: " + str(missiles)
	
	Events.connect("enemy_missile_shot", on_enemy_missile_shot)
	Events.connect("enemy_missile_hit", on_enemy_missile_hit)


func on_enemy_missile_shot(warning_message:String, travel_time, damage):
	var new_alert = countdown_alert.instantiate()
	new_alert.init(warning_message, travel_time, damage)
	enemy_ship_info.add_child(new_alert)
	print(warning_message + str(travel_time))


func on_enemy_missile_hit(msg, damage):
	hull -= damage
	hull_label.text = "Hull Integrity: " + str(hull)
