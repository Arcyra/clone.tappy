extends Node2D

# Export Variables
@export var speed: int = -120

# Constant Variables
const OFF_SCREEN: float = 120.0

func _physics_process(_delta: float) -> void:
	position.x += speed * _delta
	
	# In some cases the screen notifier won't work. So we can add this to.
	# It's the same thing.
	if position.x < get_viewport_rect().position.x - OFF_SCREEN:
		die()

func _on_score_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.increase_score()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()

func die() -> void:
	set_process(false)
	queue_free()  
