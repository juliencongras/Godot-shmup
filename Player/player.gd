extends CharacterBody2D

@export var horizontalSpeed : int
@export var verticalSpeed : int
@export var bulletScene : PackedScene

@onready var shootSpawn = $Shoot
@onready var shootingCooldown = $"Shooting cooldown"

func _physics_process(delta):
	var horizontalDirection : int = 0
	var verticalDirection : int = 0
	
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		horizontalDirection = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	else:
		horizontalDirection = 0
	
	if Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
		verticalDirection = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	else:
		verticalDirection = 0
	
	velocity.x = horizontalSpeed * horizontalDirection
	velocity.y = verticalSpeed * verticalDirection
	
	if Input.is_action_pressed("Focus"):
		velocity /= 2
	
	if Input.is_action_pressed("Shoot") and shootingCooldown.is_stopped():
		shootingCooldown.start()
		var bulletInstance = bulletScene.instantiate()
		bulletInstance.global_position = shootSpawn.global_position
		get_parent().add_child(bulletInstance)
	
	move_and_slide()
