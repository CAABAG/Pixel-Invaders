extends Area2D

signal destroy

var is_going_up
var speed = 500

func _draw():
	draw_circle(Vector2(0,0), 5, Color.cadetblue)

func _ready():
	update()

func _physics_process(delta):
	if is_going_up:
		position.y -= speed * delta
	else:
		position.y += speed * delta
	if get_global_position().y < 0 or get_viewport_rect().size.y < position.y:
		emit_signal('destroy')

func _on_Bullet_body_entered(body):
	if body.is_in_group('aliens'):
		body.queue_free()
	emit_signal('destroy')


func _on_Bullet_destroy():
	queue_free()
