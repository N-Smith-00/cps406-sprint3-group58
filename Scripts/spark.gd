extends Node2D

@export var line: Line2D
const SPEED = 80
@export var clockwise: bool = true
@onready var colider: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

@export var current_index := 0
var progress = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var points = line.points
	
	var a = line.to_global(points[current_index])
	var b = line.to_global(points[(current_index+1) % points.size()])
	var segment = (b - a)
	var length = segment.length()
	
	var dist = SPEED * delta
	var delta_prog = dist/length
	
	if progress + delta_prog < 1.0:
		progress += delta_prog
		global_position = a.lerp(b, progress) if clockwise else b.lerp(a, progress)
	else:
		dist -= (1.0 - progress) * length
		progress = 0.0
		current_index = (current_index + (1 if clockwise else -1) + points.size()) % points.size()
		
		
func change_direction():
	clockwise = not clockwise
	
func _on_body_entered(body):
	print_debug("COL")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if timer.is_stopped():
		print_debug("COL")
		clockwise = not clockwise
		progress = 1.0-progress
		timer.start(1)
