extends CharacterBody2D

@onready var player = get_node("/root/Node2D/player")
@onready var animated_sprite = $AnimatedSprite2D
var movement = Vector2.ZERO
var character_position = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	#Erstellt einen Vektor, der in die Richtung des Spielers zeigt
	movement = (player.get_character_position() - self.position)
	animate()
	#Nähert sich bis auf die Nähe 50
	if movement.length() > 35:
		velocity = movement
		move_and_slide()

func animate():
	if movement.x == 0 and movement.y == 0:
		animated_sprite.play("idle")
