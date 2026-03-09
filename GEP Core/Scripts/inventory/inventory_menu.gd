extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var inventory_manager: Node3D = $"../PlayerTemplate/InventoryManager"

var is_open = false

func _ready():
	##var items = preload("res://GEP Core/Scripts/inventory/Inventory.gd")
	close()

func _process(_delta):
	if Input.is_action_just_pressed("openInventoryMenu"):
		print("opening inventory menu")
		if is_open:
			close()
		else:
			open()

func open():
	visible = true
	is_open = true
	populate_inventory()
	
func close():
	visible = false
	is_open = false 

func populate_inventory() -> void:
	# Clear old buttons first
	for child in v_box_container.get_children():
		child.queue_free()
		
		# Get the inventory from the player
	var inventory = get_tree().get_first_node_in_group("player").get_node("InventoryManager")
	
	# One button per item in the array
	for i in range(inventory.items.size()):
		var item_name = inventory.items[i]
		var btn = Button.new()
		btn.text = item_name
		btn.custom_minimum_size = Vector2(300, 50)
		# Pass the index so we know which item to drop
		btn.pressed.connect(_on_item_button_pressed.bind(i))
		v_box_container.add_child(btn)
		
func _on_item_button_pressed(index: int) -> void:
	var inventory = get_tree().get_first_node_in_group("player").get_node("InventoryManager")
	inventory.drop_item_at(index)
	# Refresh the UI after dropping
	populate_inventory()
