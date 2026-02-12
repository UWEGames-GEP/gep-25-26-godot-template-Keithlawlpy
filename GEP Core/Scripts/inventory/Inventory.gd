extends Node3D

# ---- Game Manager ----
@export var game_manager: Node

# ---- Inventory ----
var items: Array = []

# ---- World Items Parent ----
var world_items: Node3D

func _ready() -> void:
	game_manager = get_tree().get_first_node_in_group("game_manager")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("sort_inventory"):
		sort_inventory()


# -----------------------------
# Add Item
# -----------------------------
func add_item_to_inventory(item: Node3D) -> void:
	items.append(item)


# -----------------------------
# Remove Specific Item
# -----------------------------
func remove_item_from_inventory(item: Node3D) -> void:
	if not item:
		return

	var new_position = global_transform.origin
	new_position += -global_transform.basis.z # forward
	new_position += Vector3(0, 1, 0)

	var new_item = item.duplicate()
	world_items.add_child(new_item)
	new_item.global_transform.origin = new_position
	new_item.visible = true

	items.erase(item)
	item.queue_free()


# -----------------------------
# Remove First Item (PlayState check)
# -----------------------------
func remove_first_item() -> void:
	if game_manager.current_state is PlayState and items.size() > 0:
		remove_item_from_inventory(items[0])


# -----------------------------
# Collision Pickup
# -----------------------------
func _on_body_entered(body: Node) -> void:
	if body is ItemObject:
		items.append(body)
		body.visible = false


# -----------------------------
# Sort Inventory
# -----------------------------
func sort_inventory() -> void:
	items.sort_custom(func(a, b):
		return a.rarity < b.rarity
	)
