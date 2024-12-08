extends CharacterBody2D

func _process(_delta: float) -> void:
	var direction = position;
	if(position.x < 1000):
		direction.x += 10;
	else:
		direction.x = 0;
	direction.y = 0;
	velocity = direction;
	move_and_slide()
