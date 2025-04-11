extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ldir = Vector2.ZERO
var push = false
var cur_index = 0

@export var line: Line2D

func start_push():
	pass
	#

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left","Right","Up","Down")
	
	if input_dir == Vector2.ZERO:
		input_dir = ldir
	else:
		ldir = input_dir
		
	var move_attempt = global_position + input_dir * SPEED * delta
		
	if not push:
		var best_proj := Vector2.ZERO
		var min_dist := INF
	
		var points = line.points
		for i in range(points.size()):
			var a = line.to_global(points[i])
			var b = line.to_global(points[(i+1) % points.size()])
		
			var proj = get_closest_point_on_segment(move_attempt, a, b)
			var dist = move_attempt.distance_squared_to(proj)
		
			if dist < min_dist:
				cur_index = i
				min_dist = dist
				best_proj = proj
		print_debug(cur_index)
		global_position = best_proj
	else:
		if abs(move_attempt.x) > 96 or abs(move_attempt.y) > 96:
			push = false
			return 
		global_position += input_dir * SPEED * delta
		# push logic needs to go here

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		push = true
		var origin = Vector2(-global_position)
		var orthog = Vector2.ZERO
		if ldir != Vector2.ZERO:
			orthog = Vector2(ldir.y, ldir.x)
		ldir = origin.project(orthog).normalized()
	
func get_closest_point_on_segment(p: Vector2, a: Vector2, b: Vector2) -> Vector2:
	var ab = b - a
	var t = ((p - a).dot(ab)) / ab.length_squared()
	t = clamp(t, 0.0, 1.0)
	return a + ab * t
