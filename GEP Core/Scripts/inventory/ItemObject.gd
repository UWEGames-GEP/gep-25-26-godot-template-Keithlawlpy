extends Node
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

func _process(delta: float) -> void:
	pass
