extends RigidBody2D

var speed = 500

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_pos()
	if (pos.x > 0 and Input.is_action_pressed("ui_left")):
	    pos.x += -speed * delta
	if (pos.x < 240 and Input.is_action_pressed("ui_right")):
	    pos.x += speed * delta
	set_pos(pos)
