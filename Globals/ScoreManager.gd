extends Node

# Constant Variables
const SCORES_PATH: String = "user://best_score.tres"

# Private Variables
var _best_score: int = 0

func _ready() -> void:
	load_best_score()

func save_best_score() -> void:
	var hsr: BestScoreResource = BestScoreResource.new()
	hsr.best_score = _best_score
	ResourceSaver.save(hsr, SCORES_PATH)

func load_best_score() -> void:
	if ResourceLoader.exists(SCORES_PATH):
		var hsr: BestScoreResource = load(SCORES_PATH)
		if hsr:
			_best_score = hsr.best_score

# Getter Setter
var best_score: int:
	get:
		return _best_score
	set(score):
		if _best_score < score:
			_best_score = score
			save_best_score()
