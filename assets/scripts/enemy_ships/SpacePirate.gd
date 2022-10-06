extends Node

@export var hull : int
@export var shields : int

@onready var shoot_missile_timer = $Shoot_Missile_Timer
@onready var missile_travel_timer = $Missile_Travel_Time


func _ready():
	print("SpacePirate spawned")
	start_missile_shoot()


func start_missile_shoot():
	print("Readying missile")
	shoot_missile_timer.start()


func _on_shoot_missile_timer_timeout():
	Events.emit_signal("enemy_missile_shot", "Enemy missile shot. Impact in: ", shoot_missile_timer.get_wait_time())
	missile_travel_timer.start()


func _on_missile_travel_time_timeout():
	print("Missile travel timeout")
	start_missile_shoot()

