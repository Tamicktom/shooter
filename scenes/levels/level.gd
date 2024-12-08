extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("level node is ready");	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entered");
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Exited");
	pass # Replace with function body.
