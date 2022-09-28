extends RefCounted
class_name PickupableData

var pickup_enum : int
var pick_up_scene : PackedScene
var put_down_scene : PackedScene

func _init(_pickup_enum : int, _pick_up_scene : PackedScene, _put_down_scene : PackedScene):
	pickup_enum = _pickup_enum
	pick_up_scene = _pick_up_scene
	put_down_scene = _put_down_scene
	
