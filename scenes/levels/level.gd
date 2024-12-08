extends Node2D

const SPEED = 250;

var test_array: Array[String] = ["Test", "Banana", "Stuff"];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");
	$Logo.rotation_degrees = 90;
	
	for i in test_array:
		print(i);
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 100 * delta;
	
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0;
	
	movement(delta);

	pass

func movement(delta: float) -> void:
	if Input.is_action_pressed("left"):
		$Logo.pos.x -= SPEED * delta;
	if Input.is_action_pressed("right"):
		$Logo.pos.x += SPEED * delta;
	if Input.is_action_pressed("up"):
		$Logo.pos.y -= SPEED * delta;
	if Input.is_action_pressed("down"):
		$Logo.pos.y += SPEED * delta;
