extends Node2D

var font
var col
var matrix = []
var upd = 0
var move = 0

var letters = ["б", "г", "д", "ё", "ж", "з", "и", "й", "л", "п", "у", "ф", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
var l = letters.size()

func _ready():
	font = load("res://font.fnt")
	randomize()
	for f in range(15):
		matrix.append([])
		for y in range(16):
			if y == 0: matrix[f].append(Vector2(randi() & 1, int(randi() % 11)))
			else: matrix[f].append(Vector2(0, 1))
	set_fixed_process(true)

func mtrx():
	if upd == 7: upd = 0; for f in range(15): matrix[f][0] = Vector2(int(rand_range(0, l)), int(randi() % 11))
	for f in range(15):
		if matrix[f][0].y > 0: matrix[f].push_front(Vector2(matrix[f][0].x, matrix[f][0].y - 1)); matrix[f].pop_back()
		elif matrix[f][upd].y <= 0: matrix[f].push_front(Vector2(randi() & 1, int(randi() % 11))); matrix[f].pop_back()
	upd += 1

func _fixed_process(delta): move += delta; if(move > 0.075): mtrx(); move = 0; update()

func _draw():
	for f in range(15):
		for y in range(16):
			if matrix[f][y].y == 10: col = Color(0.9, 0.9, 0.1, matrix[f][y].y * 0.1)
			else: col = Color(0.9, 0.1, 0.1, matrix[f][y].y * 0.1)
			draw_string(font, Vector2(f * 16, y * 8 + 8), letters[rand_range(0, l)], col)

