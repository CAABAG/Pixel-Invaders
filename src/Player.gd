extends Area2D

signal hit

export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2
	show()

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
	$AnimatedSprite.animation = "default"


func _on_Player_body_entered(_body):
	hide()
	emit_signal("hit")
	$CollisionPolygon2D.set_deferred("disabled", true)
