# PauseState.gd
extends BaseGameState
class_name PauseState

func enter_state() -> void:
	print("Entered Pause State")
	game_manager.get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func update_state(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		game_manager.toggle_pause()


func exit_state() -> void:
	print("Exited Pause State")
	
