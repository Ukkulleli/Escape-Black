extends CharacterBody2D

@onready var player = get_node("/root/Node2D/player")
var movement = Vector2.ZERO

func _ready():
	if player != null:
		print("Player gefunden")

func _physics_process(delta: float) -> void:
	movement = (player.get_character_position() - self.position)
	if movement.length() > 50:
		velocity = movement
		
		move_and_slide()
