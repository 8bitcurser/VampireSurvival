extends Node2D

@onready var path_follow = $Player/Path2D/PathFollow2D
@onready var game_over = $GameOver



func spawn_mob():
	const MOB = preload("res://scenes/mob.tscn")
	path_follow.progress_ratio = randf()
	var mob = MOB.instantiate()
	mob.global_position = path_follow.global_position
	add_child(mob)


func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	game_over.visible = true
	get_tree().paused = true
