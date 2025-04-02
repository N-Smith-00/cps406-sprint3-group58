extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var ldir = Vector2.ZERO



func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("Left","Right","Up","Down")
	
	if direction:
		velocity = direction * SPEED
		ldir = direction
	else :
		velocity = ldir * SPEED
		
	move_and_slide()
