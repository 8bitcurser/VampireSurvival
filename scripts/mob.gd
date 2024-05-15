extends CharacterBody2D

# this is an alternative to the _ready
# @onready var player = get_node("/root/Game/Player")
var player

const SPEED = 300.0

var health = 2

@onready var slime = $Slime

func _ready():
	player = get_node("/root/Game/Player")
	$Slime.play_walk()


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	
	move_and_slide()
	

func take_damage():
	$Slime.play_hurt()
	health -= 1
	if health == 0:
		queue_free()
		const SMOKE_SCREEN = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCREEN.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
