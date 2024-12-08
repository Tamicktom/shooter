extends CharacterBody2D

const SPEED:int = 250;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	movement();
	
	# Laser shooting input
	if Input.is_action_pressed("primaty-action"):
		print("Shoot");
	
	if Input.is_action_pressed("secondary-action"):
		print("Granade");
	pass

func movement() -> void:
	var direction = Input.get_vector("left","right","up","down");
	velocity = direction * SPEED;
	move_and_slide();
