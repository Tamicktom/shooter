extends CharacterBody2D

const SPEED:int = 350;

signal laser_input;
signal granade_input;

var can_laser: bool = true;
var can_granade: bool = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	movement();
	
	# Laser shooting input
	if Input.is_action_pressed("primaty-action") and can_laser:
		# randomly select a marker 2D for the laser start
		can_laser = false;
		laser_input.emit();
		
		# emit the position we selected
		$LaserReloadTimer.start();

	# Granade shooting input	
	if Input.is_action_pressed("secondary-action") and can_granade:
		can_granade = false;
		granade_input.emit();
		$GranadeReloadTimer.start();

func movement() -> void:
	var direction = Input.get_vector("left","right","up","down");
	velocity = direction * SPEED;
	move_and_slide();

func _on_laser_reload_timer_timeout() -> void:
	can_laser = true;
	pass # Replace with function body.


func _on_granade_reload_timer_timeout() -> void:
	can_granade = true;
	pass # Replace with function body.
