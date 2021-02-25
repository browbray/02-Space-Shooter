extends KinematicBody2D

var Enemy_Weapon = load("res://Enemy/Enemy Weapon.tscn")
onready var weapons = get_node("/root/Game/weapons")
var speed = 1
var ready_to_move = true

func _ready():
	randomize()

func _physics_process(delta):
	pass 

func die(s):
	Global.score += s
	queue_free()
	
	

func _on_shoot_timeout():
	if randf() < 0.2 and position.y > 0:
		var enemy_weapon = Enemy_Weapon.instance()
		enemy_weapon.position = position + Vector2(165,130)
		weapons.add_child(enemy_weapon) 


func _on_move_timeout():
	if randf() < 0.5 and ready_to_move:
		var new_position = Vector2(randi() % 1024,randi() % 450)
		$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		ready_to_move = false
		
		


func _on_Tween_tween_all_completed():
	ready_to_move = true
