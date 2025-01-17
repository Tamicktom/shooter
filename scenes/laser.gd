extends Area2D

@export var SPEED: int = 1000;

var direction: Vector2 = Vector2.UP;
var damage: int = 10;

func _process(delta: float) -> void:
	position += direction * SPEED * delta;

func _on_timer_timeout() -> void:
	queue_free();

func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit(damage);
	queue_free();
