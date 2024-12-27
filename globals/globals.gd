extends Node

signal stat_change();

var laser_amount: int = 256:
	set(value):
		laser_amount = value;
		stat_change.emit();

var granade_amount: int = 10:
	set(value):
		granade_amount = value;
		stat_change.emit();

var health_amount: int = 200:
	set(value):
		health_amount = value;
		stat_change.emit();

var player_pos: Vector2
