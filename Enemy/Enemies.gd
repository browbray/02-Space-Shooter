extends Node2D

var max_Enemies = 5
var Enemy = load("res://Enemy/Enemy.tscn")

func _ready():
	randomize()

func _physics_process(delta):
	if get_child_count() < max_Enemies:
		if randf() < 0.03:
			var enemy = Enemy.instance()
			enemy.position.y = -100
			enemy.position.x = randi() % 600
			add_child(enemy)
	
