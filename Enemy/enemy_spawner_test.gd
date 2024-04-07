extends Marker2D

@export var enemyScene : PackedScene

func _on_spawn_cooldown_timeout():
	var enemySceneInstance = enemyScene.instantiate()
	#enemySceneInstance.global_position = global_position
	get_parent().add_child(enemySceneInstance)
