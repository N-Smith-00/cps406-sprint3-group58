extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ldir = Vector2.ZERO
var push = false

@export var line: Line2D

func start_push():
	pass
	#

func _physics_process(delta: float) -> void:
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left","Right","Up","Down")
	
	if input_dir == Vector2.ZERO:
		velocity = Vector2.ZERO
		return
		
	var move_attempt = global_position + input_dir * SPEED * delta
	
	var best_proj := Vector2.ZERO
	var min_dist := INF
	
	var points = line.points
	for i in range(points.size()):
		var a = line.to_global(points[i])
		var b = line.to_global(points[(i+1) % points.size()])
		
		var proj = get_closest_point_on_segment(move_attempt, a, b)
		var dist = move_attempt.distance_squared_to(proj)
		
		if dist < min_dist:
			min_dist = dist
			best_proj = proj
	
	global_position = best_proj
	
func get_closest_point_on_segment(p: Vector2, a: Vector2, b: Vector2) -> Vector2:
	var ab = b - a
	var t = ((p - a).dot(ab)) / ab.length_squared()
	t = clamp(t, 0.0, 1.0)
	return a + ab * t
