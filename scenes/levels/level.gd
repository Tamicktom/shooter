extends Node2D

var laser_scene: PackedScene = preload("res://scenes/laser.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_gate_player_entered_gate(body) -> void:
	pass # Replace with function body.


func _on_player_granade_input() -> void:
	print("granade from level!");
	pass # Replace with function body.


func _on_player_laser_input(pos: Vector2) -> void:
	# Spawn the laser
	var laser = laser_scene.instantiate();
	# Update the laser position
	laser.position = pos;

	# Move the laser
	$Projectiles.add_child(laser);
		
	# Add the laser instance to a Node2D
