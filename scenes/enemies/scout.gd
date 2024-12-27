extends CharacterBody2D

var player_nearby: bool = false;

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos);

# When the player enters the attack area, set the player_nearby flag to true.
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_nearby = true;

# When the player exits the attack area, set the player_nearby flag to false.
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_nearby = false;
