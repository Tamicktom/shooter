extends CharacterBody2D;
class_name Player;

@export var max_speed: int = 700;
var speed: float = float(max_speed) / 2;
var run_speed: int = max_speed;

signal laser_input(pos: Vector2, direction: Vector2);
signal granade_input(pos: Vector2, direction: Vector2);

var can_laser: bool = true;
var can_granade: bool = true;
var is_immune_to_damage: bool = false;

var weapons_delays: Dictionary = {
	"laser": 0.25,
	"granade": 0.5
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LaserReloadTimer.wait_time = weapons_delays["laser"];
	$GranadeReloadTimer.wait_time = weapons_delays["granade"];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	movement();
	
	# Rotate the player to face the mouse position
	look_at(get_global_mouse_position());
	
	# Laser shooting input
	var player_direction = (get_global_mouse_position() - position).normalized();
	if Input.is_action_pressed("primaty-action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1;
		# randomly select a marker 2D for the laser start
		var laser_markers = $LaserStartPositions.get_children();
		var selected_marker = laser_markers[randi() % laser_markers.size()];
		can_laser = false;
		$ShootEffect.emitting = true;
		laser_input.emit(selected_marker.global_position, player_direction);
		$LaserReloadTimer.start();

	# Granade shooting input	
	if Input.is_action_pressed("secondary-action") and can_granade and Globals.granade_amount > 0:
		Globals.granade_amount -= 1;
		var granade_markers = $LaserStartPositions.get_children();
		var selected_marker = granade_markers[0];
		can_granade = false;
		# emit the position we selected
		granade_input.emit(selected_marker.global_position, player_direction);
		$GranadeReloadTimer.start();

func movement() -> void:
	var is_running = Input.is_action_pressed("run");
	var direction = Input.get_vector("left", "right", "up", "down");
	# velocity = direction * speed;
	if is_running:
		velocity = direction * run_speed;
	else:
		velocity = direction * speed;
	move_and_slide();
	Globals.player_pos = global_position;

func _on_laser_reload_timer_timeout() -> void:
	can_laser = true;

func _on_granade_reload_timer_timeout() -> void:
	can_granade = true;

func hit(damage: int) -> void:
	# If the player is immune to damage, do nothing.
	if is_immune_to_damage:
		return;
	
	# If the player is not immune to damage, subtract the damage from the health.
	Globals.health_amount -= damage;
	
	# If the player's health is less than or equal to 0, die.
	if Globals.health_amount <= 0:
		die();
	
	# Set the player to be immune to damage for a short period of time.
	is_immune_to_damage = true;
	$DamageImmunityCooldown.start();

func die() -> void:
	pass;


func _on_damage_immunity_cooldown_timeout() -> void:
	is_immune_to_damage = false;
