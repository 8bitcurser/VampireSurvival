extends Area2D


const SPEED = 1000
var travel_distance = 0
const MAX_RANGE = 1200

func _physics_process(delta):
	# we create a 2d vector using the RIGHT constant
	# which makes a vector that represents the right direction
	# and we rotate that vector based on the rotation of the bullet node
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travel_distance += SPEED * delta
	
	if travel_distance > MAX_RANGE:
		queue_free()
	


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
