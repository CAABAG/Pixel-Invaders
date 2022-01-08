extends Area2D

var Bullet = preload("res://res/scenes/Bullet.tscn")

const speed = 80
const max_speed = 160
const min_shooting_interval = 1
const max_shooting_interval = 3
var swing_range = 30
var direction = -1 # -1 = left, 1 = right
var movement = 0
var shot_timer = Timer.new()
var min_x_pos
var max_x_pos
var is_vulnurable = true

func _ready():
	min_x_pos = position.x - swing_range
	max_x_pos = position.x + swing_range
	add_child(shot_timer)
	shot_timer.connect("timeout", self, "_shoot")
	randomize()
	shot_timer.one_shot = true
	shot_timer.wait_time = rand_range(min_shooting_interval, max_shooting_interval)
	shot_timer.start()

func _shoot():
	var bullet = Bullet.instance()
	bullet.position.x = position.x
	bullet.position.y = position.y
	bullet.is_going_up = false
	get_tree().get_root().add_child(bullet)
	shot_timer.wait_time = rand_range(min_shooting_interval, max_shooting_interval)
	shot_timer.start()

func acceleration(factor):
	return speed * factor

func swing():
	if movement > max_speed:
		movement = max_speed
	if movement < -max_speed:
		movement = -max_speed
	match direction:
		-1:
			if get_global_position().x > min_x_pos:
				movement -= acceleration(.2)
				return
			direction = 1
		1:
			if get_global_position().x < max_x_pos:
				movement += acceleration(.2)
				return
			direction = -1

func _process(delta):
	swing()
	position.x += movement * delta
	$AnimatedSprite.animation = "default"

func hit():
	if is_vulnurable:
		queue_free()
