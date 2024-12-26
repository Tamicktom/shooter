extends Area2D

const rotation_speed: int = 3;

enum Type {
	LASER,
	GRANADE,
	HEALTH
};

const colors_dictionary: Dictionary = {
	Type.LASER: Color(1, 0, 0), # Red
	Type.GRANADE: Color(0, 1, 0), # Green
	Type.HEALTH: Color(0, 0, 1) # Blue
};

@export var type: Type;

func _ready() -> void:
	update_color_by_type(type);

func _process(delta: float) -> void:
	rotation += rotation_speed * delta;

func update_color_by_type(sub_type: Type) -> void:
	$Sprite2D.modulate = colors_dictionary[sub_type];
	$PointLight2D.color = colors_dictionary[sub_type];
