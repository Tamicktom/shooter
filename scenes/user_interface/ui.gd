extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label;
@onready var granade_label: Label = $GranadeCounter/VBoxContainer/Label;

func _ready() -> void:
	update_laser_text();
	update_granade_text();

func update_laser_text():
	laser_label.text = str(Globals.laser_amount);

func update_granade_text():
	granade_label.text = str(Globals.granade_amount);
