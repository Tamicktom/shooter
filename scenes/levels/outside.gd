extends LevelParent;

# var inside_level_packed:PackedScene = preload("res://scenes/levels/inside.tscn");

func _on_door_body_entered(_body: Node2D) -> void:
	print("Player entrou no portão.");
	# This is bug, we need to use call_deferred to change scene.
	# get_tree().change_scene_to_packed(inside_level_packed);
	# call_deferred("change_scene");
	change_scene();
	pass # Replace with function body.

func change_scene() -> void:
	get_tree().change_scene_to_file.bind("res://scenes/levels/inside.tscn").call_deferred();
