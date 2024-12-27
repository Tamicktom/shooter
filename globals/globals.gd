extends Node

signal health_changed();
signal laser_changed();
signal granade_changed();

var laser_amount: int = 256:
	get:
		return laser_amount;
	set(value):
		laser_amount = value;
		laser_changed.emit();

var granade_amount: int = 10:
	get:
		return granade_amount;
	set(value):
		granade_amount = value;
		granade_changed.emit();

var health_amount: int = 200:
	get:
		return health_amount;
	set(value):
		health_amount = value;
		health_changed.emit();
