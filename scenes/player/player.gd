extends CharacterBody2D

const SPEED:int = 350;

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
		print("Shoot");
		can_laser = false;
		$LaserTimer.start();

	# Granade shooting input	
	if Input.is_action_pressed("secondary-action") and can_granade:
		print("Granade");
		can_granade = false;
		$GranadeTimer.start();
		
	pass

func movement() -> void:
	var direction = Input.get_vector("left","right","up","down");
	velocity = direction * SPEED;
	move_and_slide();


func _on_granade_timer_timeout() -> void:
	print("granade timer timeout");
	$GranadeTimer.stop();
	can_granade = true;
	pass # Replace with function body.


func _on_laser_timer_timeout() -> void:
	print("laser timer timeout");
	$LaserTimer.stop();
	can_laser = true;
	pass # Replace with function body.
