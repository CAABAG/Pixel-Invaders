extends Node2D

var is_loading = true

func _ready():
	modulate.a = 0
	for enemy in get_children():
		enemy.is_vulnurable = false

func _process(_delta):
	if is_loading:
		modulate.a += 0.01
		if modulate.a > 1:
			modulate.a = 1
			is_loading = false
			for enemy in get_children():
				enemy.is_vulnurable = true
	var active = false
	for enemy in get_children():
		if enemy:
			active = true
	if not active:
		get_tree().get_root().get_node("Main").swap_levels()
		queue_free()
