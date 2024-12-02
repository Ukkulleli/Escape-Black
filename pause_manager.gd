extends "res://scene1.gd"

var paused = false
@onready var color_rect = $ColorRect
@onready var camera1 = $Camera2D
@onready var label1 = $Title
@onready var camera2 = get_node("/root/Node2D/player/Camera2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = false
	label1.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pause()
	if paused:
		color_rect.visible = true
		camera1.make_current()
		label1.visible = true
	else:
		color_rect.visible = false
		camera2.make_current()
		label1.visible = false

func pause():
	if Input.is_action_just_pressed("pause"):
		paused = !paused  # Umschalten des Pausenzustands
		get_tree().paused = paused  # Spiel pausieren oder fortsetzen
