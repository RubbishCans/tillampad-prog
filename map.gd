extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	Global.sign_text = "The Dutch fear me; \nslight elevation"

func _on_area_2d_area_exited(area):
	Global.sign_text = ""
	Global.text_vis = 0

