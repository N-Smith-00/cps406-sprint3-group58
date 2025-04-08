extends Node2D

const SPEED = 60
var dirx = 1
var diry = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += SPEED * delta * dirx
	position.y += SPEED * delta * diry
