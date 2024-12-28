extends CharacterBody2D

class_name Scout;

signal laser(pos: Vector2, direction: Vector2);

var player_nearby: bool = false;
var can_laser: bool = true;
var gun_toggle: bool = false;
var health: int = 100;

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos);
		if can_laser:
			var laser_marker = $LaserSpawnPositions.get_child(gun_toggle); # Get the laser marker
			var pos: Vector2 = laser_marker.global_position; # Get the position of the laser marker
			var direction: Vector2 = (Globals.player_pos - global_position).normalized(); # Get the direction to the player
			laser.emit(pos, direction); # Emit the laser signal
			can_laser = false; # Set the can_laser flag to false
			$LaserCooldown.start(); # Start the laser cooldown timer
			gun_toggle = !gun_toggle; # Toggle the gun

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

func hit(damage: int) -> void:
	print("Scout hit by ", damage);
	health -= damage;
	if health <= 0:
		die();

func die() -> void:
	print("Scout died");
	queue_free();
