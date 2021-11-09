extends Area2D

const speed = 80
const max_speed = 160
var direction = -1 # -1 = left, 1 = right
var movement = 0

var min_x_pos
var max_x_pos

func _ready():
	position.x = (min_x_pos + max_x_pos)/2

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
				movement -= acceleration(.1)
				return
			direction = 1
		1:
			if get_global_position().x < max_x_pos:
				movement += acceleration(.1)
				return
			direction = -1

func _process(delta):
	swing()
	position.x += movement * delta
	$AnimatedSprite.animation = "default"

func hit():
	queue_free()
