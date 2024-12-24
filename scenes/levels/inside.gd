extends LevelParent

func _on_exit_gate_body_entered(_body: Node2D) -> void:
	print("player has entered");
	change_scene();
	pass # Replace with function body.

func change_scene() -> void:
	get_tree().change_scene_to_file.bind("res://scenes/levels/outside.tscn").call_deferred();
