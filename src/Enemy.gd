extends Area2D

export (PackedScene) var Bullet

func hit():
	queue_free()
