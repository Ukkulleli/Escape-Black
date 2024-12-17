extends "res://scene1.gd"

var paused = false
@onready var inventory = []

@onready var color_rect = $ColorRect
@onready var player_rect = $player
@onready var camera1 = $Camera2D
@onready var label1 = $Title
@onready var inv = get_node("/root/Node2D/player")
@onready var camera2 = get_node("/root/Node2D/player/Camera2D")
@onready var player = get_node("/root/Node2D/Pause Manager/player/Sprite2D")
@onready var item_list = $ItemList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree() != null:
		process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = true
	label1.visible = true
	player_rect.visible = true
	load_inventory()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree() != null:
		pause()
	if paused:
		camera1.make_current()
		player.play("idle")
		
	else:
		camera2.make_current()

func load_inventory():
	inventory = inv.inventory
	item_list.clear()
	if inventory.is_empty() == false:
		print(inventory)
		for item in inventory:
			item_list.add_item(item)
	else:
		print("Der Inventar ist leer.")


func pause():
	if Input.is_action_just_pressed("pause"):
		paused = !paused  # Umschalten des Pausenzustands
		get_tree().paused = paused  # Spiel pausieren oder fortsetzen
		if paused:
			load_inventory()
