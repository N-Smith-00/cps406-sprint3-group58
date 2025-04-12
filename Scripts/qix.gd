extends CharacterBody2D


const SPEED = 100.0
@onready var timer: Timer = $Timer

@onready var ray_left: RayCast2D = $RayLeft
@onready var ray_down: RayCast2D = $RayDown
@onready var ray_right: RayCast2D = $RayRight
@onready var ray_up: RayCast2D = $RayUp


var direction = Vector2(-1,0)
	

func _physics_process(delta: float) -> void:
	if ray_down.is_colliding() and is_bounds(ray_down):
		direction = Vector2(0,-1)
		timer.start(0.4)
	if ray_up.is_colliding() and is_bounds(ray_up):
		direction = Vector2(0,1)
		timer.start(0.4)
	if ray_left.is_colliding() and is_bounds(ray_left):
		direction = Vector2(1,0)
		timer.start(0.4)
	if ray_right.is_colliding() and is_bounds(ray_right):
		direction= Vector2(-1,0)
		timer.start(0.4)
	
	velocity = SPEED * direction

	move_and_slide()

func is_bounds(ray: RayCast2D) -> bool:
	var collider = ray.get_collider()
	return collider != null and collider.is_in_group("bounds")


func _on_timer_timeout() -> void:
	timer.start(randf_range(1,2))
	if randi_range(0,1) == 0:
		direction = Vector2([-1,1].pick_random(),0)
	else:
		direction = Vector2(0,[-1,1].pick_random())
