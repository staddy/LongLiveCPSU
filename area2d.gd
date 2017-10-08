extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(get_overlapping_bodies().size() > 0):
		get_parent().matrix[floor(get_pos().x / get_parent().fontSize)][floor(get_pos().y / get_parent().fontSize)] = 1.0
	else:
		get_parent().matrix[floor(get_pos().x / get_parent().fontSize)][floor(get_pos().y / get_parent().fontSize)] *= max(0, 1 - 10.0 * delta)