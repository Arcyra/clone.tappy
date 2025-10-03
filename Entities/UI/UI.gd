extends Control

# Onready Variables
@onready var score: Label = $MarginContainer/Score
@onready var game_over: Label = $"MarginContainer/VBoxContainer/Game Over"
@onready var press: Label = $MarginContainer/VBoxContainer/Press
@onready var timer: Timer = $Timer

var _loaded: bool = false

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _enter_tree() -> void:
	SignalHub.PLANE_DIED.connect(_on_plane_died)
	SignalHub.SCORE_INCREASED.connect(_on_plane_score_increased)

# We add this function into UI bc. When the plane dies the game pauses so the inputs won't work.
# But we can set the UI process mode into Always and this why when the game pauses the UI dont.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit", false):
		GameManager.load_main_scene()
	if event.is_action_pressed("Start", false) and press.visible and _loaded:
		GameManager.load_game_scene()

func _on_plane_died() -> void:
	_loaded = false
	game_over.show()
	timer.start()

func _on_timer_timeout() -> void:
	game_over.hide()
	press.show()
	_loaded = true

func _on_plane_score_increased(amount: int) -> void:
	score.text = str(amount)
