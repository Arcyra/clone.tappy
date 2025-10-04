extends Node

const SIMPLE_TRANSITION = preload("uid://ds3wgc65da2vp")
const COMPLEX_TRANSITION = preload("uid://e7kdby34u17n")
const GAME = preload("uid://qcwx5nfgvy4p")
const MAIN = preload("uid://v58fuf1hrlfb")

# Variables
var next_scene: PackedScene
var best_score: int = 0

func update_best_score(amount: int) -> void:
	if amount > best_score: best_score = amount
	SignalHub.UPDATE_BEST_SCORE_UI.emit(best_score)

func add_complex() -> void:
	var ct = COMPLEX_TRANSITION.instantiate()
	add_child(ct)

func load_game_scene() -> void:
	next_scene = GAME
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_main_scene() -> void:
	next_scene = MAIN
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_scene() -> void:
	if not next_scene: return
	get_tree().change_scene_to_packed(next_scene)
	next_scene = null
