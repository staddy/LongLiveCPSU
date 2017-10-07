extends RigidBody2D

var speed = 100.0
var speedMax = speed + 10
var speedMin = speed - 10

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var vel = get_linear_velocity()
	if(vel.length() > speedMax or vel.length() < speedMin):
		set_linear_velocity(vel.normalized() * speed)
	var cb = get_colliding_bodies()
	if(cb.size() > 0):
		if(cb[0].is_in_group("block")):
			cb[0].queue_free()