extends Area2D

@export var SPEED: int = 1000;
const ALIVE_TIME: int = 3; # Seconds

var direction: Vector2 = Vector2.UP;

func _process(delta: float) -> void:
  $Timer.wait_time = ALIVE_TIME; # Reset the timer
  position += direction * SPEED * delta;

func _on_timer_timeout() -> void:
  queue_free();
