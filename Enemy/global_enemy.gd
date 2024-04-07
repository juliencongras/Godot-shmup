extends CharacterBody2D

var enemySpeed = 300
var playerPosition : Vector2

func _ready():
	playerPosition = Global.playerPosition

func _physics_process(delta):
	var targetPlayer = global_position.move_toward(playerPosition, delta)
	look_at(targetPlayer)
	velocity = targetPlayer.normalized() * enemySpeed
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
