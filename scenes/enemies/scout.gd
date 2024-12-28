extends CharacterBody2D

class_name Scout;

signal laser(pos: Vector2, direction: Vector2);

var player_nearby: bool = false;
var can_laser: bool = true;
var gun_toggle: bool = false;
var health: int = 30;
var is_immune_to_damage: bool = false;

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
	# If the scout is immune to damage, do nothing.
	if is_immune_to_damage:
		return;
	
	# If the scout is not immune to damage, subtract the damage from the health.
	health -= damage;
	
	# If the scout's health is less than or equal to 0, die.
	if health <= 0:
		die();
	
	# Set the scout to be immune to damage for a short period of time.
	is_immune_to_damage = true;
	$DamageImmunityCooldown.start();

func die() -> void:
	queue_free();


func _on_damage_immunity_cooldown_timeout() -> void:
	is_immune_to_damage = false;
