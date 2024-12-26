extends CharacterBody2D;
class_name Player;

@export var max_speed: int = 700;
var speed: float = float(max_speed) / 2;
var run_speed: int = max_speed;

signal laser_input(pos: Vector2, direction: Vector2);
signal granade_input(pos: Vector2, direction: Vector2);
signal update_stats();

var can_laser: bool = true;
var can_granade: bool = true;

var weapons_delays: Dictionary = {
	"laser": 0.25,
	"granade": 0.5
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LaserReloadTimer.wait_time = weapons_delays["laser"];
	$GranadeReloadTimer.wait_time = weapons_delays["granade"];
	print(Globals.laser_amount);
	pass # Replace with function body.


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
		# emit the position we selected
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

func _on_laser_reload_timer_timeout() -> void:
	can_laser = true;
	pass # Replace with function body.


func _on_granade_reload_timer_timeout() -> void:
	can_granade = true;
	pass # Replace with function body.

func add_item(type: ItemTypes.Type, amount: int) -> void:
	if type == ItemTypes.Type.LASER:
		Globals.laser_amount += amount;
	elif type == ItemTypes.Type.GRANADE:
		Globals.granade_amount += amount;
	elif type == ItemTypes.Type.HEALTH:
		Globals.health_amount += amount;
	update_stats.emit();
