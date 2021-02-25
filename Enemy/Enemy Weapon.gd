extends Area2D

var speed = 1.3
var velocity = Vector2.ZERO 

func _physics_process(delta):
		position += velocity
		velocity.y += speed
		if position.y > 620:
			queue_free()
		



func _on_Enemy_Weapon_body_entered(body):
	body.die(0) 
	queue_free()
