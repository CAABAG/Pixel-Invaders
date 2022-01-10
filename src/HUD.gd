extends CanvasLayer

var hue = 0.0

func _process(_delta):
	$Label.text = String(get_tree().get_root().get_node("Main").score)
	$Label.modulate = Color.from_hsv(hue, 1.0, 1.0)
	if hue < 1.0:
		hue += 0.001
	else:
		hue = 0.0
