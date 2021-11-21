extends Node2D

export (PackedScene) var Enemy

var score = 0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	var alien = Enemy.instance()
	alien.position.y = screen_size.y/5
	add_child(alien)
	alien.add_to_group("aliens")
