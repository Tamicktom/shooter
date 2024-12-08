extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_gate_player_entered_gate() -> void:
	print("player has entered the gate");
	pass # Replace with function body.
