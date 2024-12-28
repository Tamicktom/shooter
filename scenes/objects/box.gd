extends ItemContainer;

var opened: bool = false;

func hit(_damage:int):
	if not opened:
		# "open" the box
		$LidSprite.hide();

		var pos: Array[Vector2] = get_all_spawn_positions();

		for i in range(pos.size()):
			open.emit(pos[i], current_direction);

		opened = true;
