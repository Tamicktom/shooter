extends StaticBody2D;

class_name ItemContainer;

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation);

signal open(position: Vector2, direction: Vector2);

func hit():
	print("Object has been hit");
	open.emit(position, current_direction);

## Returns a random spawn position from the container's available spawn points.
## The position is selected from child nodes under the `SpawnPositions` node.
## Returns: A `Vector` representing the global position of the selected spawn point.
func get_random_spawn_position() -> Vector2:
	var random_index: int = randi_range(0, $SpawnPositions.get_child_count() - 1);
	var spawn_position: Marker2D = $SpawnPositions.get_child(random_index);
	return spawn_position.global_position;
