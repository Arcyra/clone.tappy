extends Node

const GAME = preload("uid://qcwx5nfgvy4p")
const MAIN = preload("uid://v58fuf1hrlfb")

# Private Variables
var best_score: int = 0

func update_best_score(amount: int) -> void:
	if amount > best_score: best_score = amount
	SignalHub.UPDATE_BEST_SCORE_UI.emit(best_score)

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
