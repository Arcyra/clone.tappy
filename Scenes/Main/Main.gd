extends Control

# Constant Variables
const GAME = preload("uid://qcwx5nfgvy4p")

func _unhandled_input(event: InputEvent) -> void:
	# _input(event) → Called first, catches all input events.
	# _unhandled_input(event) → Called only if input wasn’t handled by UI or _input.
	# Use _input for general input, _unhandled_input for leftover/unconsumed input.
	
	if event.is_action_pressed("Start", false):
		get_tree().change_scene_to_packed(GAME)
