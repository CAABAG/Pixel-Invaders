extends Node2D

var is_loading = true
var is_game_over = false

func _ready():
	modulate.a = 0
	for enemy in get_children():
		enemy.is_vulnurable = false

func load_level():
	modulate.a += 0.01
	if modulate.a > 1:
		modulate.a = 1
		for enemy in get_children():
			enemy.is_vulnurable = true
		is_loading = false

func run_game_over():
	for enemy in get_children():
		enemy.shot_timer.stop()
	modulate.a -= 0.01
	if modulate.a < 0:
		queue_free()

func _process(_delta):
	if is_game_over:
		run_game_over()
		return
	if is_loading:
		load_level()
		return
	var active = false
	for enemy in get_children():
		if enemy:
			active = true
	if not active:
		get_tree().get_root().get_node("Main").swap_levels()
		queue_free()
