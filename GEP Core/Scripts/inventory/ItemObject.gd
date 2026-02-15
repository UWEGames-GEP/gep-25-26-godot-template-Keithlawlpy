extends Area3D
class_name ItemObject

# ---- Rarity ----
enum RarityType {
	COMMON,
	UNCOMMON,
	RARE,
	EPIC,
	LEGENDARY
}

@export var rarity: RarityType = RarityType.COMMON

# ---- Item Info ----
@export var item_name: String = ""

func _ready():
	body_entered.connect(_on_body_entered)
	
func _process(delta):
	rotate(Vector3.UP, 1.0 * delta)
	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		# Access the player's InventoryManager
		var inv = body.get_node("InventoryManager")
		inv.add_item(item_name)
		
		queue_free()
		
