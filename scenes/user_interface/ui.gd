extends CanvasLayer

# Colors
var green: Color = Color("6bbfa3");
var red: Color = Color(0.9, 0, 0, 1);

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label;
@onready var granade_label: Label = $GranadeCounter/VBoxContainer/Label;

func _ready() -> void:
	update_laser_text();
	update_granade_text();

func update_laser_text():
	var amount: int = Globals.laser_amount;
	laser_label.text = str(amount);
	if amount <= 0:
		laser_label.modulate = red;
	else:
		laser_label.modulate = green;
	

func update_granade_text():
	var amount: int = Globals.granade_amount;
	granade_label.text = str(amount);
	if amount <= 0:
		granade_label.modulate = red;
	else:
		granade_label.modulate = green;
