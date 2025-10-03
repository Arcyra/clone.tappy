extends Node2D

# Onready Variables
@onready var pipes_container: Node = $PipesContainer
@onready var upper_marker: Marker2D = $UpperMarker
@onready var lower_marker: Marker2D = $LowerMarker

# Constant Variables
const PIPES = preload("uid://bgn6y5ygcukb8")

func _ready() -> void:
	get_tree().paused = false
	spawn_pipes()

# This function works intantly.
func _enter_tree() -> void:
	SignalHub.PLANE_DIED.connect(_on_plane_died)

func spawn_pipes() -> void:
	var np: Node2D = PIPES.instantiate()
	var x_pos: float = upper_marker.position.x
	var y_pos: float = randf_range(  
		lower_marker.position.y,
		upper_marker.position.y
	)
	np.position = Vector2(x_pos, y_pos)
	pipes_container.add_child(np)

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()

func _on_plane_died() -> void:
	get_tree().paused = true 
