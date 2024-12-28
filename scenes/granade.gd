extends RigidBody2D;

# signal explode_granade(entities: Array[Node2D]);

@export_range(1, 2000, 1) var SPEED: int = 1000;

var direction: Vector2 = Vector2.UP;

func _ready() -> void:
	$Explosion.hide();

func explode() -> void:
	$AnimationPlayer.play("Explosion");
	$Explosion.show();
	$CollisionShape2D.disabled = true;
	for entity in get_overlapping_bodies():
		if "hit" in entity:
			entity.hit(80);

func get_overlapping_bodies() -> Array[Node2D]:
	var overlapping_bodies: Array[Node2D] = $ExplosionArea.get_overlapping_bodies();
	return overlapping_bodies;
