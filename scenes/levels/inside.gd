extends LevelParent


func _on_exit_gate_body_entered(_body: Node2D) -> void:
	print("player has entered");
	var tween = create_tween();
	tween.tween_property($Player, "speed", 0, 0.5);
	pass # Replace with function body.
