extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_position(pos:Vector2)->void:
	var tmp_pos = pos;
	tmp_pos.y += 50;
	position = tmp_pos;
	
