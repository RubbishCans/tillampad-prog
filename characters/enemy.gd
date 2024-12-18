extends Area2D

@onready var particles = $GPUParticles2D
@onready var _animated_sprite = $AnimatedSprite2D
var array = ["N", "NW", "NE", "W", "E", "S", "SW", "SE"]

func _ready() -> void:
	particles.emitting = false

	var random
	random = randi_range(0, 7)
	_animated_sprite.play(array[random])

func _on_area_entered(area):
	if area.is_in_group("enemy") or area.is_in_group("potion"):
		Global.new_enemy.emit()
		queue_free()

	particles.emitting = true
	if area.is_in_group('player'):
		Global.e_d_count += 1
	await get_tree().create_timer(0.15).timeout
	queue_free()
	
