extends Area2D

var screen_size
var movement = 0
var speed = 90

func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2

func acceleration(factor):
	return speed * factor

func process_movement():
	var is_right_pressed = Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D)
	var is_left_pressed = Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A)
	if is_right_pressed:
		if (movement < 0):
			movement += acceleration(.85)
		else:
			movement += acceleration(.5)
	if is_left_pressed:
		if (movement > 0):
			movement -= acceleration(.85)
		else:
			movement -= acceleration(.5)
	if not is_left_pressed and not is_right_pressed:
		if (movement > 0):
			if (movement - acceleration(.85) < 0):
				movement = 0
			else:
				movement -= acceleration(.85)
		elif (movement < 0):
			if (movement + acceleration(.85) > 0):
				movement = 0
			else:
				movement += acceleration(.85)

func _process(delta):
	process_movement()
	position.x += movement * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
	$AnimatedSprite.animation = "default"
