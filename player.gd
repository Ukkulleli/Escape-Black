extends CharacterBody2D

const MAX_SPEED = 200
const ACL = 1500
const FRICTION = 600

var input = Vector2.ZERO

func _physics_process(delta):
	movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		# Bremsen bei Stillstand
		if velocity.length() > (FRICTION * delta):
			velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		# Beschleunigung bei Eingabe
		velocity += (input * ACL * delta)
		velocity = velocity.limit_length(MAX_SPEED)
	
	# Bewegung anwenden
	move_and_slide()
