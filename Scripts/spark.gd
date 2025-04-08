extends Node2D

const SPEED = 120
var dirx = 1
var diry = 0

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_down: RayCast2D = $RayDown
@onready var ray_left: RayCast2D = $RayLeft
@onready var ray_up: RayCast2D = $RayUp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_right.is_colliding() and ray_down.is_colliding():
		dirx = -1
	if ray_left.is_colliding() and ray_down.is_colliding():
		dirx = 1
	position.x += SPEED * delta * dirx
	position.y += SPEED * delta * diry
