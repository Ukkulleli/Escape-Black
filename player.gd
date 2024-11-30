extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const speed = 100

var input = Vector2.ZERO
var direction = "down"

func _physics_process(delta):
	input.x = Input.get_axis("left","right")
	input.y = Input.get_axis("up","down")
	
	if input:
		velocity = input * speed
	else:
		velocity = Vector2.ZERO
	animate()
	move_and_slide()

func animate():
	input = get_input()
	if input.x == 0 and input.y == 0:
		play_idle()
	if input.x == 0 and input.y == 1:
		animated_sprite.play("run_down")
		direction = "down"
	if input.x == 0 and input.y == -1:
		animated_sprite.play("run_up")
		direction = "up"
	if input.x == 1 and input.y == 0:
		animated_sprite.play("run_right")
		direction = "right"
	if input.x == -1 and input.y == 0:
		animated_sprite.play("run_left")
		direction = "left"

func play_idle():
	if direction == "down":
		animated_sprite.play("idle_down")
	if direction == "up":
		animated_sprite.play("idle_up")
	if direction == "left":
		animated_sprite.play("idle_left")
	if direction == "right":
		animated_sprite.play("idle_right")

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input
