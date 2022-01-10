extends Area2D

var movement = 0
var speed = 90
var shot_timestamp = 0
var half_height
var is_hit = false
var is_loading = true
export (PackedScene) var Bullet
export var shooting_interval = 600

func _ready():
	half_height = get_node("Sprite").texture.get_size().y/2
	modulate.a = 0

func shoot():
	if OS.get_ticks_msec() - shot_timestamp < shooting_interval:
		return
	shot_timestamp = OS.get_ticks_msec()
	var bullet = Bullet.instance()
	bullet.position.x = position.x
	bullet.position.y = position.y - half_height
	bullet.is_going_up = true
	get_tree().get_root().add_child(bullet)

func process_shooting():
	var should_shoot = false
	if Input.is_key_pressed(KEY_SPACE): should_shoot = true
	if Input.is_key_pressed(KEY_CONTROL): should_shoot = true
	if Input.is_mouse_button_pressed(BUTTON_LEFT): should_shoot = true
	if (should_shoot):
		shoot()

func acceleration(factor):
	return speed * factor

func stop_player():
	if movement < 0:
		movement += acceleration(.85)
		movement = 0 if movement > 0 else movement
		return
	if movement > 0:
		movement -= acceleration(.85)
		movement = 0 if movement < 0 else movement
		return

func process_side_movement(is_left_pressed, is_right_pressed):
	var at_left_border = position.x <= 0
	var at_right_border = position.x >= get_viewport_rect().size.x
	if at_left_border or at_right_border:
		movement = 0
	if is_left_pressed and is_right_pressed:
		stop_player()
		return
	if is_left_pressed:
		if at_left_border:
			return
		movement -= acceleration(.3)
		return
	if is_right_pressed:
		if at_right_border:
			return
		movement += acceleration(.3)
		return
	stop_player()

func process_movement():
	var is_right_pressed = Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D)
	var is_left_pressed = Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A)
	process_side_movement(is_left_pressed, is_right_pressed)

func process_hit():
	if modulate.a > 0:
		modulate.a -= 0.05
		return
	queue_free()

func _process(delta):
	if is_loading:
		loadSprite()
		return
	if is_hit:
		process_hit()
		return
	process_movement()
	process_shooting()
	position.x += movement * delta

func loadSprite():
	modulate.a += 0.01
	if modulate.a > 1:
		modulate.a = 1
		is_loading = false

func hit():
	is_hit = true
