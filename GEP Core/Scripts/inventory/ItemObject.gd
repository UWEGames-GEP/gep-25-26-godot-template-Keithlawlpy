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

func _ready() -> void:
	pass

func _process(delta):
	rotate(Vector3.UP, 1.0 * delta)


func _on_body_entered(_body: Node3D) -> void:
	queue_free()
	
