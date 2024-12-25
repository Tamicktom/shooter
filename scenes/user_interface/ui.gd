extends CanvasLayer

# Colors
var green: Color = Color("6bbfa3");
var red: Color = Color(0.9, 0, 0, 1);

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label;
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect;
@onready var granade_label: Label = $GranadeCounter/VBoxContainer/Label;
@onready var granade_icon: TextureRect = $GranadeCounter/VBoxContainer/TextureRect;

func _ready() -> void:
	update_laser_text();
	update_granade_text();

func update_laser_text() -> void:
	update_color(laser_label, laser_icon, Globals.laser_amount);

func update_granade_text() -> void:
	update_color(granade_label, granade_icon, Globals.granade_amount);

func update_color(label: Label, icon: TextureRect, amount: int) -> void:
	label.text = str(amount);
	if amount <= 0:
		label.modulate = red;
		icon.modulate = red;
	else:
		label.modulate = green;
		icon.modulate = green;
