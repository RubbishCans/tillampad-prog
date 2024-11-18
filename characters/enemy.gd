extends Area2D

@onready var particles = $GPUParticles2D
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	particles.emitting = false
	_animated_sprite.play("default")

func _on_area_entered(area):
	particles.emitting = true
	if area.is_in_group('player'):
		Global.e_d_count += 1
	await get_tree().create_timer(0.15).timeout
	queue_free()
