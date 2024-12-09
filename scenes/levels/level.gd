extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_gate_player_entered_gate(body) -> void:
	print("player has entered the gate");
	print(body);
	pass # Replace with function body.


func _on_player_granade_input() -> void:
	print("granade from level!");
	pass # Replace with function body.


func _on_player_laser_input() -> void:
	print("laser from level!");
	pass # Replace with function body.
