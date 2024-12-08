extends Node2D

const SPEED = 250;
var player_position = Vector2(0,0);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_position = $Player.position;
	$Logo.update_position(player_position);
	pass
