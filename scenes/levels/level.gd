extends Node2D;

class_name LevelParent;

var laser_scene: PackedScene = preload("res://scenes/laser.tscn");
var granade_scene: PackedScene = preload("res://scenes/granade.tscn");
var item_scene: PackedScene = preload("res://scenes/objects/item.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened);
	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("laser", _on_scout_laser);

func _on_container_opened(pos: Vector2, direction: Vector2):
	var item = item_scene.instantiate();
	item.position = pos;
	item.direction = direction;
	item.randomize_type();
	# deferred add child
	$Items.call_deferred("add_child", item);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass ;

func _on_player_granade_input(pos: Vector2, direction: Vector2) -> void:
	var granade: RigidBody2D = granade_scene.instantiate();
	granade.position = pos;
	granade.linear_velocity = direction * granade.SPEED;
	$Projectiles.add_child(granade);
	$UI.update_granade_text();

func _on_scout_laser(pos: Vector2, direction: Vector2) -> void:
	var laser: Area2D = laser_scene.instantiate();
	laser.position = pos;
	laser.direction = direction;
	laser.rotation = direction.angle();
	laser.modulate = Color(1, 0, 0); # Red color
	$Projectiles.add_child(laser);

func _on_player_laser_input(pos: Vector2, direction: Vector2) -> void:
	# Spawn the laser
	var laser: Area2D = laser_scene.instantiate();
	# Update the laser position
	laser.position = pos;
	laser.direction = direction;
	laser.rotation = direction.angle();
	$Projectiles.add_child(laser);
	$UI.update_laser_text();

func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween();
	tween.set_parallel(true);
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.7, 0.7), 1).set_trans(Tween.TRANS_QUAD);
	tween.tween_property($Player, "modulate:a", 0, 2).from(0.5);

func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween();
	tween.set_parallel(true);
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1);
	tween.tween_property($Player, "modulate:a", 1, 2);
