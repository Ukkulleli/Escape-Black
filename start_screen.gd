extends Node2D

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("attack"):
		label.text = "Spiel wird gestartet..."
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://node_2d.tscn")
	
