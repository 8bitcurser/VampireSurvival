extends CharacterBody2D

signal health_depleted


# you can also directly do $HappyBoo instead of wit the var assignment
# or get_node('HappyBoo').whatevermethod()
# all alternatives
# make unique name works within the scene and for that scene keeps it in mem
# giving it more performance
@onready var happy_boo = $HappyBoo
@onready var hurtbox = $hurtbox
@onready var progress_bar = $ProgressBar

var health = 100.0

# method run by the engine to update the char
func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left", "move_right", "move_up", "move_down"
	)
	velocity = direction * 600
	move_and_slide() 
	if direction:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
	const DAMAGE_RATE = 35.0
	var overlapping_mobs = hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		progress_bar.value = health
		if health < 0.0:
			health_depleted.emit()
	
