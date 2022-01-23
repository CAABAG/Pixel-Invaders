extends CanvasLayer

var is_game_over = false
var is_idle = false
var hue = 0.0

func _ready():
	start()

func start():
	$StarsLeft.set_emitting(true)
	$StarsCentre.set_emitting(true)
	$StarsRight.set_emitting(true)
	$GameOverLabel.modulate.a = 0
	get_tree().get_root().get_node("Main").score = 0
	$Score.set_position(Vector2(300,0))
	is_game_over = false
	is_idle = false

func run_game_over():
	$StarsLeft.set_emitting(false)
	$StarsCentre.set_emitting(false)
	$StarsRight.set_emitting(false)
	if $Score.get_global_position().y < 400:
		var current_pos = $Score.get_global_position()
		$Score.set_global_position(Vector2(current_pos.x,current_pos.y+2.5))
		return
	if $GameOverLabel.modulate.a < 1:
		$GameOverLabel.modulate.a += 0.01
		$RestartButton.modulate.a += 0.01
		$QuitButton.modulate.a += 0.01
		$RestartButton.disabled = false
		$QuitButton.disabled = false
		return
	is_game_over = false
	is_idle = true

func _process(_delta):
	if is_game_over:
		run_game_over()
		return
	if is_idle:
		return
	$Score.text = String(get_tree().get_root().get_node("Main").score)
	$Score.modulate = Color.from_hsv(hue, 1.0, 1.0)
	if hue < 1.0:
		hue += 0.001
	else:
		hue = 0.0

func _on_RestartButton_pressed():
	$RestartButton.modulate.a = 0
	$QuitButton.modulate.a = 0
	$RestartButton.disabled = true
	$QuitButton.disabled = true
	start()
	get_tree().get_root().get_node("Main").start()


func _on_QuitButton_pressed():
	get_tree().quit()
