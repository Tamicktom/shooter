extends Node2D;

var laser_scene: PackedScene = preload("res://scenes/laser.tscn");
var granade_scene: PackedScene = preload("res://scenes/granade.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;

func _on_gate_player_entered_gate(_body: Node2D) -> void:
	pass; # Replace with function body.

func _on_player_granade_input(pos: Vector2) -> void:
	var granade: RigidBody2D = granade_scene.instantiate();
	granade.position = pos;
	granade.linear_velocity = Vector2.UP * 100;
	$Projectiles.add_child(granade);

func _on_player_laser_input(pos: Vector2) -> void:
	# Spawn the laser
	var laser: Area2D = laser_scene.instantiate();
	# Update the laser position
	laser.position = pos;
	$Projectiles.add_child(laser);
