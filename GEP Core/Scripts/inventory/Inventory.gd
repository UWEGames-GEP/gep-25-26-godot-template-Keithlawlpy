extends Node3D

# ---- Game Manager ----
@export var game_manager: Node

# ---- Inventory ----
var items: Array = []

# ---- World Items Parent ----
var world_items: Node3D

func _ready() -> void:
	game_manager = get_tree().get_first_node_in_group("game_manager")
