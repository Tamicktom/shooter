extends LevelParent;

func _on_door_body_entered(_body: Node2D) -> void:
	change_scene();

func change_scene() -> void:
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn");
