extends Node3D

# ---- Game Manager ----
@export var game_manager: Node

@export var item_scenes: Dictionary = {"Chicken": preload("res://GEP Core/Objectnodes/collectable.tscn"),
"Chicken2": preload("res://GEP Core/Objectnodes/collectable.tscn"), "Chicken3": preload("res://GEP Core/Objectnodes/collectable.tscn"),"Chicken4": preload("res://GEP Core/Objectnodes/collectable.tscn")}

# ---- Inventory ----
var items: Array[String] = []

# ---- World Items Parent ----
var collectable_items: Node3D

func _ready() -> void:
	game_manager = get_tree().get_first_node_in_group("game_manager")
	collectable_items = get_tree().get_first_node_in_group("collectable_items")

func _process(_delta):
	if Input.is_action_just_pressed("drop_object"):
		print("item drop button pressed")
		drop_item()


func add_item(id: String):
	items.append(id)
	print("Picked up: ", id)

func drop_item():
	if items.is_empty():
		return
		
	var id = items.pop_back()  #removes last item
	var scene: PackedScene = item_scenes.get(id)
		
	if scene == null:
		print("no scene found for item: ", id,"" )
		return
			
	var dropped_item = scene.instantiate()
	
	# Assign the correct item data
	if dropped_item is ItemObject:
		dropped_item.item_name = id
		
		
	#position infront of the player 
	var player = get_parent()
	dropped_item.global_transform.origin = player.global_transform.origin + player.global_transform.basis.z * 2.0
		
	get_tree().get_root().add_child(dropped_item)
		
	print("Dropped: ", id, "")
