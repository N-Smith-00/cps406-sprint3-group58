extends Line2D

var queue : Array
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
const COLLISION_SIZE = Vector2(1, 4)
signal push_end(queue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos = _get_position()
	if queue.is_empty():
		make_rec(pos)
	queue.push_front(pos)
	
	if !get_parent().push:
		queue.clear()
	
	clear_points()
	
	for point in queue:
		add_point(point)

func make_rec(pos):
	if collision_shape_2d:
		collision_shape_2d.queue_free()
		collision_shape_2d = null
	## Create a new CollisionShape2D
	collision_shape_2d = CollisionShape2D.new()
	# Create a new RectangleShape2D
	var shape = RectangleShape2D.new()
	shape.extents = COLLISION_SIZE / 2  # Set half the size for extents
	collision_shape_2d.shape = shape
	# Set the position of the collision shape to the start position
	collision_shape_2d.position = pos
	# Add the CollisionShape2D to the Area2D
	area_2d.add_child(collision_shape_2d)
	# Optionally, set collision layers and masks
	area_2d.collision_layer = 1
	area_2d.collision_mask = 1
	
	
func _get_position():
	return get_parent().position
