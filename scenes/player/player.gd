extends CharacterBody2D

const SPEED: int = 350;

signal laser_input(pos: Vector2, direction: Vector2);
signal granade_input(pos: Vector2, direction: Vector2);

var can_laser: bool = true;
var can_granade: bool = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LaserReloadTimer.wait_time = 0.25;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	movement();

	# Rotate the player to face the mouse position
	look_at(get_global_mouse_position());
	
	# Laser shooting input
	if Input.is_action_pressed("primaty-action") and can_laser:
		# randomly select a marker 2D for the laser start
		var laser_markers = $LaserStartPositions.get_children();
		var selected_marker = laser_markers[randi() % laser_markers.size()];
		var player_direction = (get_global_mouse_position() - position).normalized();

		can_laser = false;
		laser_input.emit(selected_marker.global_position, player_direction);
		
		# emit the position we selected
		$LaserReloadTimer.start();

	# Granade shooting input	
	if Input.is_action_pressed("secondary-action") and can_granade:
		var granade_markers = $LaserStartPositions.get_children();
		var selected_marker = granade_markers[randi() % granade_markers.size()];
		var player_direction = (get_global_mouse_position() - position).normalized();
		can_granade = false;
		# emit the position we selected
		granade_input.emit(selected_marker.global_position, player_direction);
		$GranadeReloadTimer.start();

func movement() -> void:
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * SPEED;
	move_and_slide();

func _on_laser_reload_timer_timeout() -> void:
	can_laser = true;
	pass # Replace with function body.


func _on_granade_reload_timer_timeout() -> void:
	can_granade = true;
	pass # Replace with function body.
