extends CharacterBody2D;

var is_enemy:bool = true;

func _process(_delta: float) -> void:
	var direction = Vector2.RIGHT;
	velocity = direction * 400;
	move_and_slide()

func hit():
	print("damage");
