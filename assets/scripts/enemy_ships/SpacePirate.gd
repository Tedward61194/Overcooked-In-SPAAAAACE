extends Node

@export var hull : int
@export var shields : int
@export var missile_travel_time : int
@export var missile_damage : int

@onready var shoot_missile_timer = $Shoot_Missile_Timer


func _ready():
	print("SpacePirate spawned")
	start_missile_shoot()


func start_missile_shoot():
	print("Readying missile")
	shoot_missile_timer.start()


func _on_shoot_missile_timer_timeout():
	Events.emit_signal( \
		"enemy_missile_shot", "ENEMY MISSILE INBOUND. IMPACT IN: ", \
		missile_travel_time, \
		missile_damage)
