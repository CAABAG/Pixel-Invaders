extends Node2D

var score = 0
var level_one = preload("res://res/scenes/LevelOne.tscn")
var level_two = preload("res://res/scenes/LevelTwo.tscn")
var current_scene

func _ready():
	add_child(level_one.instance())
	current_scene = "level_one"

func _process(_delta):
	for child in get_children():
		if not is_instance_valid(child):
			remove_child(child)

func swap_levels():
	if current_scene == "level_one":
		add_child(level_two.instance())
		current_scene = "level_two"
	else:
		add_child(level_one.instance())
		current_scene = "level_one"
