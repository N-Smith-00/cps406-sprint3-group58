extends Node2D

@onready var bounds: Line2D = $Bounds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_p_end(queue: Variant) -> void:
	print("hello")
	for p in queue:
		bounds.add_point(p)
