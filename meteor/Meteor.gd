extends Area2D

var speed = 3

func _physics_process(delta):
	position.y += speed
	if position.y >= 1200:
		queue_free()
	



func _on_Meteor_body_entered(body):
	body.die(0)
