extends RigidBody2D;

@export_range(1, 2000, 1) var SPEED: int = 1000;

var direction: Vector2 = Vector2.UP;

func _ready() -> void:
  $Explosion.hide();
  pass

func _process(_delta: float) -> void:
  pass

func explode() -> void:
  $AnimationPlayer.play("Explosion");
  $Explosion.show();
  $CollisionShape2D.disabled = true;
