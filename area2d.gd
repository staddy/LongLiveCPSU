extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var x
var y

func _ready():
	x = floor(get_pos().x / get_parent().fontSize)
	y = floor(get_pos().y / get_parent().fontSize)
	set_fixed_process(true)

func _fixed_process(delta):
	if(get_overlapping_bodies().size() > 0):
		get_parent().matrix[x][y] = 1.0