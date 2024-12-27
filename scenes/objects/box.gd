extends ItemContainer;

var opened: bool = false;

func hit():
	if not opened:
		# "open" the box
		$LidSprite.hide();

		var pos: Vector2 = get_random_spawn_position();

		for i in range(5):
			open.emit(pos, current_direction);

		opened = true;
