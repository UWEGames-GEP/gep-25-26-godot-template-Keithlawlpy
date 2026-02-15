extends RefCounted
class_name BaseGameState

var game_manager: Node

func _init(manager: Node) -> void:
	game_manager = manager

func enter_state() -> void:
	pass

func update_state(_delta: float) -> void:
	pass

func exit_state() -> void:
	pass

func late_update() -> void:
	pass
