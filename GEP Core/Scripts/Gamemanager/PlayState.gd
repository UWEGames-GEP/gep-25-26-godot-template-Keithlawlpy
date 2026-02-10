# PlayState.gd
extends BaseGameState
class_name PlayState

func enter_state() -> void:
	print("Entered Play State")
	
	if game_manager.game_ui:
		game_manager.game_ui.visible = true
		
	game_manager.get_tree().paused = false


func update_state(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		game_manager.toggle_pause()


func exit_state() -> void:
	print("Exited Play State")
