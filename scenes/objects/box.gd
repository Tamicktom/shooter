extends ItemContainer

func hit():
	$LidSprite.hide();
	var pos: Vector2 = get_random_spawn_position();
	open.emit(pos, current_direction);
