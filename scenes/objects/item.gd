extends Area2D

@export var type: ItemTypes.Type;

const rotation_speed: int = 3;

var colors_dictionary: Dictionary = {
	ItemTypes.Type.LASER: {
		"color": Color(1, 0, 0),
		"light_color": Color(1, 0, 0),
		"func": func():
			Globals.laser_amount += 10,
	},
	ItemTypes.Type.GRANADE: {
		"color": Color(0, 1, 0),
		"light_color": Color(0, 1, 0),
		"func": func():
			Globals.granade_amount += 10,
	},
	ItemTypes.Type.HEALTH: {
		"color": Color(0, 0, 1),
		"light_color": Color(0, 0, 1),
		"func": func():
			Globals.health_amount += 200,
	}
};

func _ready() -> void:
	update_color_by_type(type);

func _process(delta: float) -> void:
	rotation += rotation_speed * delta;

func update_color_by_type(sub_type: ItemTypes.Type) -> void:
	$Sprite2D.modulate = colors_dictionary[sub_type]["color"];
	$PointLight2D.color = colors_dictionary[sub_type]["light_color"];

func _on_body_entered(body: Node2D) -> void:
	# verify if the body is the player
	if body is Player:
		colors_dictionary[type]["func"].call();
	queue_free();
