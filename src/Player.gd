extends Area2D

var screen_size
var movement = 0
var speed = 90
var shot_timestamp = 0
var half_height
export (PackedScene) var Bullet

enum Direction {RIGHT, LEFT}

func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y - screen_size.y/9
	half_height = get_node("AnimatedSprite").get_sprite_frames().get_frame($AnimatedSprite.animation,0).get_size().y/2

func acceleration(factor):
	return speed * factor

func process_side_movement(is_key_pressed, dir):
	if is_key_pressed:
		match dir:
			Direction.RIGHT:
				if movement < 0:
					movement += acceleration(.85)
				else:
					movement += acceleration(.5)
			Direction.LEFT:
				if movement > 0:
					movement -= acceleration(.85)
				else:
					movement -= acceleration(.5)

func process_no_movement(is_right_pressed, is_left_pressed):
	if not is_right_pressed and not is_left_pressed:
		if movement > 0:
			if movement - acceleration(.85) < 0:
				movement = 0
			else:
				movement -= acceleration(.85)
		elif movement < 0:
			if movement + acceleration(.85) > 0:
				movement = 0
			else:
				movement += acceleration(.85)

func process_shooting():
	var should_shoot = false
	if Input.is_key_pressed(KEY_SPACE): should_shoot = true
	if Input.is_key_pressed(KEY_CONTROL): should_shoot = true
	if Input.is_mouse_button_pressed(BUTTON_LEFT): should_shoot = true
	if (should_shoot):
		if OS.get_ticks_msec() - shot_timestamp < 100:
			return
		shot_timestamp = OS.get_ticks_msec()
		var b = Bullet.instance()
		b.position.x = position.x
		b.position.y = position.y - half_height
		b.is_player_owned = true
		get_tree().get_root().add_child(b)

func process_movement():
	var is_right_pressed = Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D)
	var is_left_pressed = Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A)
	process_side_movement(is_right_pressed, Direction.RIGHT)
	process_side_movement(is_left_pressed, Direction.LEFT)
	process_no_movement(is_right_pressed, is_left_pressed)

func _process(delta):
	process_movement()
	process_shooting()
	position.x += movement * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
	$AnimatedSprite.animation = "default"
