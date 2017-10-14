extends Node2D

var SCREEN_WIDTH = Globals.get("display/width")
var SCREEN_HEIGHT = Globals.get("display/height")

var width = 24
var height = 13
var matrix = []
var lettersMatrix = []

var fontSize = 10
var fontOffset = 3
var time = 0.0

#var letters = ["б", "г", "д", "ё", "ж", "з", "и", "й", "л", "п", "у", "ф", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
var letters = ["吧","爸","八","百","北","不","田","由","甲","申","甴","电","甶","男","甸","甹","町","画","甼","甽","甾","甿","畀","畁","畂","畃","畄","畅","畆","畇","畈","畉","畊","畋","界","畍","畎","畏","畐","畑"]
var l = letters.size()

var font

var area2d = load("res://area2d.tscn")

func _ready():
	OS.set_window_maximized(true)
	#OS.set_window_fullscreen(true)
	randomize()
	font = load("res://font.fnt")
	for x in range(width):
		matrix.append([])
		lettersMatrix.append([])
		for y in range(height):
			matrix[x].append(0)
			lettersMatrix[x].append(rand_range(0, l))
			var a = area2d.instance()
			a.set_pos(Vector2(x * fontSize, y * fontSize))
			add_child(a)
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	update()
	for x in range(width):
		for y in range(height):
			matrix[x][y] *= max(0, 1 - 10.0 * delta)

func _draw():
	for x in range(width):
		for y in range(height):
			if matrix[x][y] > 0.01:
				var color = Color(0.1, 0.9, 0.4, matrix[x][y])
				if(rand_range(0, 100) > 98):
					lettersMatrix[x][y] = rand_range(0, l)
				draw_string(font, Vector2(x * fontSize, (y + 1) * fontSize - fontOffset), letters[lettersMatrix[x][y]], color, -1)

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON or event.type == InputEvent.SCREEN_TOUCH):
		var a;
		if(event.pos.x < SCREEN_WIDTH / 2):
			a = "ui_left";
		else:
			a = "ui_right"
		if(event.is_pressed()):
			Input.action_press(a)
		else:
			Input.action_release(a)
