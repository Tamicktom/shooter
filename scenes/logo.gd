extends Sprite2D

var pos: Vector2 = Vector2.ZERO;
const SPEED: int = 500;
var test_scale: float = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos = Vector2(300,200);
	position = pos;
	
	test_scale = 2;
	
	#var test_rotation = 45;
	#rotation_degrees = test_rotation
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#test_scale += 0.01
	position = pos;
	#rotation_degrees += SPEED;
	#scale = Vector2(test_scale, test_scale);
	pass
