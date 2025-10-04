class_name Tappy extends CharacterBody2D

# Signal Variables
#signal DIED
#signal SCORE_INCREASED

# Onready Variables
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine: AudioStreamPlayer2D = $Engine
@onready var score: AudioStreamPlayer2D = $Score

# Constant Variables
const JUMP_VELOCITY = -400.0

# Private Variables
var _died: bool = false
var _score: int = 0

func _physics_process(delta: float) -> void:
	movement(delta)
	if is_on_floor():
		on_died()
	
	move_and_slide()

func movement(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("Jump") and not _died:
		velocity.y = JUMP_VELOCITY
		animation_player.play("Jump")

func on_died() -> void:
	set_physics_process(false)
	_died = true
	engine.stop()
	animated_sprite_2d.stop()
	SignalHub.PLANE_DIED.emit()
	ScoreManager.best_score = _score

func increase_score():
	score.play()
	_score+=1  
	SignalHub.SCORE_INCREASED.emit(_score)
