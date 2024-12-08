extends Node2D

const SPEED:int = 250;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(delta);
	pass

func movement(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta;
	if Input.is_action_pressed("right"):
		position.x += SPEED * delta;
	if Input.is_action_pressed("up"):
		position.y -= SPEED * delta;
	if Input.is_action_pressed("down"):
		position.y += SPEED * delta;
