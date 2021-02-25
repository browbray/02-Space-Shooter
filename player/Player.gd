extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = .5
var Weapon1 = load("res://weapons/Weapon1.tscn")
var Weapon2 = load("res://weapons/Weapon2.tscn")
onready var weapons = get_node("/root/Game/weapons")


func _ready():
	pass

func _physics_process(_delta):
	velocity += get_input()*speed
	position += velocity
	if position.x >= 500:
		velocity = Vector2.ZERO
		position.x = 500
	if position.x <= -510:
		velocity = Vector2.ZERO 
		position.x = -510
	if Input.is_action_just_pressed("shoot1"):
		var weapon1 = Weapon1.instance()
		weapon1.position = position + Vector2(523,480)
		weapons.add_child(weapon1)
		
	if Input.is_action_just_pressed("shoot2"):
		var weapon2 = Weapon2.instance()
		weapon2.position = position + Vector2(523,480)
		weapons.add_child(weapon2)

func get_input():
	var input_vector = Vector2.ZERO 
	if Input.is_action_pressed("left"):
		input_vector += Vector2(-1,0)
	if Input.is_action_pressed("right"):
		input_vector += Vector2(1,0)
	return input_vector
	
func die(s):
	queue_free()
	
