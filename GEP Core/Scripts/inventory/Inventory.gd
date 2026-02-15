extends Node3D

# ---- Game Manager ----
@export var game_manager: Node

# ---- Inventory ----
var items: Array[String] = []

# ---- World Items Parent ----
var world_items: Node3D

func _ready() -> void:
	game_manager = get_tree().get_first_node_in_group("game_manager")

func add_item(id: String):
	items.append(id)
	print("Picked up: ", id)
