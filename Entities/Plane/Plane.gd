extends CharacterBody2D

# Onready Variables
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Constant Variables
const JUMP_VELOCITY = -400.0

# Private Variables
var _died: bool = false
var _score: int = 0

func _physics_process(delta: float) -> void:
	if _died: return
	
	movement(delta)
	if is_on_floor():
		on_died()
	
	move_and_slide()

func movement(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_VELOCITY
		animation_player.play("Jump")

func on_died() -> void:
	_died = true
	animated_sprite_2d.stop()
	# I waited little bit bc. If the scene reloads instantly it throws error. 
	await get_tree().create_timer(0.1).timeout
	get_tree().reload_current_scene()    

func increase_score():
	_score+=1
