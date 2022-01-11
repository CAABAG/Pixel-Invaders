extends Area2D

var is_going_up
var speed = 500
var score = 10

func _draw():
	draw_circle(Vector2(0,0), 5, Color.crimson)

#func _ready():
#	update()
#	$ShootingBlast.play()

func _physics_process(delta):
	if is_going_up:
		position.y -= speed * delta
	else:
		position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_area_entered(area):
	if area.is_in_group("aliens"):
		if is_going_up == true:
			area.hit()
			get_tree().get_root().get_node("Main").score += score
			queue_free()
	elif area.is_in_group("player"):
		if is_going_up == false:
			area.hit()
			queue_free()
