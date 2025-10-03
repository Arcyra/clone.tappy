extends Control

# Onready Variables
@onready var score: Label = $MarginContainer/Score

func _ready() -> void:
	get_tree().paused = false
	score.text = str(ScoreManager.best_score)

func _unhandled_input(event: InputEvent) -> void:
	# _input(event) → Called first, catches all input events.
	# _unhandled_input(event) → Called only if input wasn’t handled by UI or _input.
	# Use _input for general input, _unhandled_input for leftover/unconsumed input.
	
	if event.is_action_pressed("Start", false):
		GameManager.load_game_scene()
