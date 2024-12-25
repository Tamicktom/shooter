extends CanvasLayer

func _ready() -> void:
	$AnimationPlayer.play("fade_to_transparent");

func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_to_black");
	await $AnimationPlayer.animation_finished;
	get_tree().change_scene_to_file.bind(target).call_deferred();
	$AnimationPlayer.play("fade_to_transparent");
	await $AnimationPlayer.animation_finished;
