extends Node2D

export (PackedScene) var Enemy

var aliens = []

var main_alien

func _ready():
	for i in 30:
		var alien = Enemy.instance()
		add_child(alien)
		aliens.append(alien)
	for i in range(0,10):
		aliens[i].position.x = 57 * (i+1)
		aliens[i].position.y = 100
	for i in range(10,20):
		aliens[i].position.x = 57 * ((i+1)-10) + 25
		aliens[i].position.y = 150
	for i in range(20,30):
		aliens[i].position.x = 57 * ((i+1)-20)
		aliens[i].position.y = 200
