extends ItemContainer

var opened: bool = false;

func hit(_damage:int):
	if not opened:
		$LidSprite.hide();
		var pos: Vector2 = get_random_spawn_position();
		open.emit(pos, current_direction);
		opened = true;
