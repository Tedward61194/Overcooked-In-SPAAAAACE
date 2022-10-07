extends Control

var seconds : int = 0
var dsec = 0
var damage : int = 0

@onready var sec_text = $GridContainer/sec
@onready var dsec_text = $GridContainer/dsec

func init(_alert_text:String, _dur:int, _damage):
	$GridContainer/AlertText.set_text(_alert_text)
	seconds = _dur
	$TotalTimer.set_wait_time(_dur)
	damage = _damage

func _physics_process(delta):
	if seconds > 0 and dsec <= 0:
		seconds -= 1
		dsec = 10
	
	if seconds >= 10:
		sec_text.set_text(str(seconds))
	else:
		sec_text.set_text("0"+str(seconds))
	if dsec >= 10:
		dsec_text.set_text(str(dsec))
	else:
		dsec_text.set_text("0"+str(dsec))


func _on_d_sec_timer_timeout():
	dsec -= 1


func _on_total_timer_timeout():
		Events.emit_signal("enemy_missile_hit", "We've been hit!", damage)
		queue_free()
