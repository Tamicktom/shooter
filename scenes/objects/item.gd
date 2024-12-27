extends Area2D

@export var type: ItemTypes.Type;

var direction: Vector2;
var distance: int = randi_range(100, 200);

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

	#tween
	var target_position: Vector2 = position + direction * distance;
	var movement_tween: Tween = create_tween();
	movement_tween.tween_property(self, "position", target_position, 0.3);

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

func randomize_type() -> void:
	var random_index: int = randi_range(0, ItemTypes.Type.values().size() - 1);
	type = ItemTypes.Type.values()[random_index];
	update_color_by_type(type);
