extends Node2D

@onready var bounds: Line2D = $Bounds
var min_dist = INF
var closest_index = -1
var  left_top
var  left_bottom
var  right_top
var  right_bottom

func _ready() -> void:
	left_top = bounds.points[0]
	left_bottom = bounds.points[1]
	right_top = bounds.points[2]
	right_bottom = bounds.points[3]

func _on_character_body_2d_p_end(queue: Variant) -> void:
	var p = bounds.points
	var first = queue[0]
	var last = queue[len(queue) -1 ]
	var index = find_index(first,last)
	for new_point in queue:
		print(new_point)
		bounds.add_point(new_point,index)
	print(bounds.points)

func find_index(first,last):
	if is_point_between(first,left_bottom,left_top):
		return 1
	if is_point_between(first,right_top,left_top):
		return 0
	if is_point_between(first,right_top,right_bottom):
		return 2
	return 1
	
func is_point_between(point: Vector2, point_a: Vector2, point_b: Vector2) -> bool:
	var total_dist = point_a.distance_to(point_b)
	var dist_to_a = point.distance_to(point_a)
	var dist_to_b = point.distance_to(point_b)

	return abs((dist_to_a + dist_to_b) - total_dist) < 0.001
