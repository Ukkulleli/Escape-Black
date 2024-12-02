extends Node2D

@onready var label = $Label
@onready var progress_bar = $ProgressBar

var progress = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("attack"):
		label.text = "Spiel wird gestartet..."
		progress_bar.visible = true
		while progress <= 100:
			progress_bar.value = progress
			progress += 1
			await get_tree().create_timer(0.05).timeout
		await get_tree().create_timer(0.5).timeout
		if get_tree() != null:
			get_tree().change_scene_to_file("res://node_2d.tscn")
	
