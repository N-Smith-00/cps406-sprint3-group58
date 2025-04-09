extends CollisionShape2D

var par: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var par: CharacterBody2D = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_CollisionShape2D_body_entered(body):
	print_debug("Col")
