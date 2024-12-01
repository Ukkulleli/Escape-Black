extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const speed = 100

var input = Vector2.ZERO
var direction = "down"
var attacking = false 

func _ready():
	# Signal für das Ende der Animation verbinden
	animated_sprite.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _physics_process(delta):
	# Erstellt einen Vektor, der die Tastatureingaben darstellt
	input.x = Input.get_axis("left","right")
	input.y = Input.get_axis("up","down")
	
	# Falls gerade nicht angegriffen wird und eine Taste gerückt wird
	if input and !attacking:
		velocity = input * speed
	else:
		velocity = Vector2.ZERO
	
	# Wenn Leertaste gedrückt wird, und ma gerade nicht angreift, wird angegriffen
	if Input.is_action_just_pressed("attack") and !attacking:
		attack()
	
	# Wenn man gerade nicht angreift, wird die Animation für Laufen oder Stehen abgespielt
	if !attacking:
		animate()
	
	# Bewegung wird ausgeführt
	move_and_slide()

func animate():
	if input.x == 0 and input.y == 0:
		play_idle()
	elif input.x == 0 and input.y > 0:
		animated_sprite.play("run_down")
		direction = "down"
	elif input.x == 0 and input.y < 0:
		animated_sprite.play("run_up")
		direction = "up"
	elif input.x > 0 and input.y == 0:
		animated_sprite.play("run_right")
		direction = "right"
	elif input.x < 0 and input.y == 0:
		animated_sprite.play("run_left")
		direction = "left"

func attack():
	attacking = true
	match direction:
		"down":
			animated_sprite.play("attack_down")
		"up":
			animated_sprite.play("attack_up")
		"left":
			animated_sprite.play("attack_left")
		"right":
			animated_sprite.play("attack_right")

func play_idle():
	match direction:
		"down":
			animated_sprite.play("idle_down")
		"up":
			animated_sprite.play("idle_up")
		"left":
			animated_sprite.play("idle_left")
		"right":
			animated_sprite.play("idle_right")

func _on_animation_finished():
	attacking = false

func test():
	#get_tree().change_scene_to_file()
	pass

func get_character_position() -> Vector2:
	return self.position
