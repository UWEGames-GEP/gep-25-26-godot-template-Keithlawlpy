extends Node3D

# ---- Game Manager ----
@export var game_manager: Node

@export var item_scenes: Dictionary = {"ball": preload("res://GEP Core/collectable.tscn")}

# ---- Inventory ----
var items: Array[String] = []

# ---- World Items Parent ----
var collectable_items: Node3D

func _ready() -> void:
	game_manager = get_tree().get_first_node_in_group("game_manager")
	collectable_items = get_tree().get_first_node_in_group("collectable_items")

func _process(delta):
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
		
	#position infront of the player 
	var player = get_parent()
	dropped_item.global_transform.origin = player.global_transform.origin + player.global_transform.basis.z * -1.0
		
	collectable_items.add_child(dropped_item)
		
	print("Dropped: ", id, "")
