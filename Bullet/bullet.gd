extends RigidBody2D

@export var bulletSpeed : int
@export var bulletDamage : int

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.y = -bulletSpeed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
