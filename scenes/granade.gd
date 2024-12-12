extends RigidBody2D;

@export_range(100, 2000, 100) var SPEED: int = 1000;
@export_range(1, 10, 1) var ALIVE_TIME: int = 3; # Seconds

var direction: Vector2 = Vector2.UP;

func _process(_delta: float) -> void:
  $Timer.wait_time = ALIVE_TIME; # Reset the timer

func _on_timer_timeout() -> void:
  queue_free();
