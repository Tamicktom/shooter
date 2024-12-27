extends CharacterBody2D

signal laser(pos: Vector2, direction: Vector2);

var player_nearby: bool = false;
var can_laser: bool = true;
var gun_toggle: int = 0; # 0 for left, 1 for right

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos);
		if can_laser:
			var laser_markers = $LaserSpawnPositions.get_children();
			var selected_marker = laser_markers[gun_toggle];
			var pos: Vector2 = selected_marker.global_position;
			var direction: Vector2 = (Globals.player_pos - global_position).normalized();
			laser.emit(pos, direction);
			can_laser = false;
			$LaserCooldown.start();
			toggle_gun();

# When the player enters the attack area, set the player_nearby flag to true.
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_nearby = true;

# When the player exits the attack area, set the player_nearby flag to false.
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_nearby = false;


func _on_laser_cooldown_timeout() -> void:
	can_laser = true;

func toggle_gun() -> void:
	if gun_toggle == 0:
		gun_toggle = 1;
	else:
		gun_toggle = 0;
