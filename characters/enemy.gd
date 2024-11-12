extends Area2D

@onready var particles = $GPUParticles2D

func _ready() -> void:
	particles.emitting = false

func _on_area_entered(area):
	particles.emitting = true
	if area.is_in_group('player'):
<<<<<<< Updated upstream
		EDCount.e_d_count += 1
	await get_tree().create_timer(0.2).timeout
=======
		Global.e_d_count += 1
	await get_tree().create_timer(0.15).timeout
>>>>>>> Stashed changes
	queue_free()
