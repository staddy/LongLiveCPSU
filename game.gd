extends Node2D

var width = 24
var height = 13
var matrix = []

var fontSize = 10

#var letters = ["б", "г", "д", "ё", "ж", "з", "и", "й", "л", "п", "у", "ф", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
var letters = ["吧","爸","八","百","北","不","田","由","甲","申","甴","电","甶","男","甸","甹","町","画","甼","甽","甾","甿","畀","畁","畂","畃","畄","畅","畆","畇","畈","畉","畊","畋","界","畍","畎","畏","畐","畑"]
var l = letters.size()

var font

var area2d = load("res://area2d.tscn")

func _ready():
	randomize()
	font = load("res://font.fnt")
	for x in range(width):
		matrix.append([])
		for y in range(height):
			matrix[x].append(0)
			var a = area2d.instance()
			a.set_pos(Vector2(x * fontSize, y * fontSize))
			add_child(a)
	set_fixed_process(true)

func _fixed_process(delta):
	update()

func _draw():
	for x in range(width):
		for y in range(height):
			if matrix[x][y] != 0:
				var color = Color(0.1, 0.9, 0.4, matrix[x][y])
				draw_string(font, Vector2(x * fontSize, y * fontSize + fontSize), letters[rand_range(0, l)], color)