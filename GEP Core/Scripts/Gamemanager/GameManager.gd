extends Node
class_name GameManager

@export var game_ui: Node
var current_state: BaseGameState


func _ready() -> void:
	change_state(PlayState.new(self))


func _process(delta: float) -> void:
	if current_state:
		current_state.update_state(delta)

	if Input.is_action_just_pressed("freecursor"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED		



func change_state(new_state: BaseGameState) -> void:
	if current_state:
		current_state.exit_state()
	current_state = new_state
	current_state.enter_state()


func toggle_pause() -> void:
	if current_state is PlayState:
		change_state(PauseState.new(self))
		print("toggle pause")
	elif current_state is PauseState:
		change_state(PlayState.new(self))
		print("toggle play")
