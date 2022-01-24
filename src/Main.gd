extends Node2D

enum {START_GAME, STOP_GAME, IDLE}

var score = 0
var status = START_GAME

var level_one = preload("res://res/scenes/LevelOne.tscn")
var level_two = preload("res://res/scenes/LevelTwo.tscn")
var player = preload("res://res/scenes/Player.tscn")

var current_scene

func _ready():
	start()

func start():
	current_scene = level_one
	add_child(current_scene.instance())
	add_child(player.instance())
	get_node("Player").add_to_group("player")
	$Music.play()
	status = IDLE

func run_game_over():
	for child in get_children():
		if child is ColorRect or child is AudioStreamPlayer:
			continue
		child.is_game_over = true
	$Music.stop()
	status = IDLE

func _process(_delta):
	if status == START_GAME:
		start()
		return
	if status == STOP_GAME:
		run_game_over()
		return

func swap_levels():
	if current_scene == level_one:
		current_scene = level_two
	else:
		current_scene = level_one
	add_child(current_scene.instance())
