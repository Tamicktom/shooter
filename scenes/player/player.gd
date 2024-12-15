extends CharacterBody2D

const SPEED: int = 350;
const RUN_SPEED: int = 700;

signal laser_input(pos: Vector2, direction: Vector2);
signal granade_input(pos: Vector2, direction: Vector2);

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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	movement();

	# Rotate the player to face the mouse position
	look_at(get_global_mouse_position());
	
	# Laser shooting input
	var player_direction = (get_global_mouse_position() - position).normalized();
	if Input.is_action_pressed("primaty-action") and can_laser:
		# randomly select a marker 2D for the laser start
		var laser_markers = $LaserStartPositions.get_children();
		var selected_marker = laser_markers[randi() % laser_markers.size()];
		can_laser = false;
		laser_input.emit(selected_marker.global_position, player_direction);
		# emit the position we selected
		$LaserReloadTimer.start();

	# Granade shooting input	
	if Input.is_action_pressed("secondary-action") and can_granade:
		var granade_markers = $LaserStartPositions.get_children();
		var selected_marker = granade_markers[0];
		can_granade = false;
		# emit the position we selected
		granade_input.emit(selected_marker.global_position, player_direction);
		$GranadeReloadTimer.start();

func movement() -> void:
	var is_running = Input.is_action_pressed("run");
	var direction = Input.get_vector("left", "right", "up", "down");
	# velocity = direction * SPEED;
	if is_running:
		velocity = direction * RUN_SPEED;
	else:
		velocity = direction * SPEED;
	move_and_slide();

func _on_laser_reload_timer_timeout() -> void:
	can_laser = true;
	pass # Replace with function body.


func _on_granade_reload_timer_timeout() -> void:
	can_granade = true;
	pass # Replace with function body.
