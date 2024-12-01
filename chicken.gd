extends CharacterBody2D

@onready var player = get_node("/root/Node2D/player")
@onready var animated_sprite = $AnimatedSprite2D
var movement = Vector2.ZERO
var character_position = Vector2.ZERO
var timer = 0
var seated = false

func _ready():
	pass
func _physics_process(delta):
	#Erstellt einen Vektor, der in die Richtung des Spielers zeigt
	movement = (player.get_character_position() - self.position)
	
	#Nähert sich bis auf die Nähe 50
	if movement.length() > 35:
		velocity = movement
		timer = 0
	elif movement.length() < 20:
		velocity.x = 50 
	else:
		velocity = Vector2.ZERO
		timer += 1
	print(timer)
	
	
	animate()
	move_and_slide()

func animate():
	if velocity.x == 0 and velocity.y == 0:
		if timer >= 85 and seated == false:
			animated_sprite.play("sit")
			seated = true
		elif !seated:
			animated_sprite.play("idle")
	else:
		if seated:
			animated_sprite.play("stand_up")
			if animated_sprite.animation_finished:
				seated = false
		elif !seated:
			if velocity.x < 0:
				animated_sprite.flip_h = false
			elif velocity.x > 0:
				animated_sprite.flip_h = true
			animated_sprite.play("run")
