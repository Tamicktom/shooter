extends StaticBody2D;

class_name ItemContainer;

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation);

signal open(position: Vector2, direction: Vector2);

func hit(_damage:int):
	open.emit(position, current_direction);

## Returns a random spawn position from the container's available spawn points.
## The position is selected from child nodes under the `SpawnPositions` node.
## Returns: A `Vector` representing the global position of the selected spawn point.
func get_random_spawn_position() -> Vector2:
	var random_index: int = randi_range(0, $SpawnPositions.get_child_count() - 1);
	var spawn_position: Marker2D = $SpawnPositions.get_child(random_index);
	return spawn_position.global_position;

## Returns all spawn positions from the container's available spawn points.
## The positions are retrieved from child nodes under the `SpawnPositions` node.
## Returns: An `Array` of `Vector2` representing the global positions of all spawn points.
func get_all_spawn_positions() -> Array[Vector2]:
	var spawn_positions: Array[Vector2] = [];
	for spawn_position in $SpawnPositions.get_children():
		spawn_positions.append(spawn_position.global_position);
	return spawn_positions;
