extends "res://scene1.gd"

var paused = false
@onready var color_rect = $ColorRect
@onready var player_rect = $player
@onready var camera1 = $Camera2D
@onready var label1 = $Title
@onready var camera2 = get_node("/root/Node2D/player/Camera2D")
@onready var player = get_node("/root/Node2D/Pause Manager/player/Sprite2D")
@onready var slot1 = $Button1
@onready var slot2 = $Button2
@onready var slot3 = $Button3
@onready var slot4 = $Button4
@onready var slot5 = $Button5
@onready var slot6 = $Button6
@onready var slot7 = $Button7
@onready var slot8 = $Button8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree() != null:
		process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = false
	label1.visible = false
	player_rect.visible = false
	show_buttons(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree() != null:
		pause()
	if paused:
		color_rect.visible = true
		camera1.make_current()
		label1.visible = true
		player_rect.visible = true
		player.play("idle")
		show_buttons(true)
	else:
		color_rect.visible = false
		camera2.make_current()
		label1.visible = false
		player_rect.visible = false
		show_buttons(false)
		

func show_buttons(value):
	slot1.visible = value
	slot2.visible = value
	slot3.visible = value
	slot4.visible = value
	slot5.visible = value
	slot6.visible = value
	slot7.visible = value
	slot8.visible = value

func pause():
	if Input.is_action_just_pressed("pause"):
		paused = !paused  # Umschalten des Pausenzustands
		get_tree().paused = paused  # Spiel pausieren oder fortsetzen
