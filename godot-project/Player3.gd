extends CharacterBody2D

var score: int = 0
var speed: int = 60
var coin_amount = 0
var jumpForce: int = 165
var gravity: int = 240
var vel: Vector2 = Vector2()
@onready var sprite: AnimatedSprite2D = get_node("Sprite2D")

func _ready():
	get_node("BatterySound").play()


func _physics_process(_delta):
	vel.x = 0
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		$Sprite2D.play("Walking")
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("move_right"):
		vel.x += speed
		$Sprite2D.play("Walking")
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.play("Idle")
	if not is_on_floor():
		$Sprite2D.play("Jump")
	set_velocity(vel)
	set_up_direction(Vector2.UP)
	move_and_slide()
	vel = velocity
	
	vel.y += gravity * _delta

	
	if coin_amount == 1:
		
		get_tree().change_scene_to_file("res://WinScene.tscn")
	
	if is_on_floor() and Input.is_action_just_pressed("sprint"):
		speed = 110
	if Input.is_action_just_released("sprint"):
		speed = 60



	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		get_node("JumpSound").play()


func add_coin():
	coin_amount += 1
	get_node("BatterySound").play()


func reset():
	
	get_tree().change_scene_to_file("res://Level 3.tscn")
	coin_amount = 0
