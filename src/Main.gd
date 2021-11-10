extends Node2D

export (PackedScene) var Enemy

var swing_range = 30
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	var alien = Enemy.instance()
	alien.min_x_pos = screen_size.x/2 - swing_range
	alien.max_x_pos = screen_size.x/2 + swing_range
	alien.position.y = screen_size.y/5
	add_child(alien)
	alien.add_to_group("aliens")
