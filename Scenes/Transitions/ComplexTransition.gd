extends CanvasLayer

func switch_scene() -> void:
	GameManager.load_scene()

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
