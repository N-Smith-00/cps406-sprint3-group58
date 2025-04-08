extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ldir = Vector2.ZERO



func _physics_process(delta: float) -> void:
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("Left","Right","Up","Down")
	if motion_mode == MOTION_MODE_GROUNDED:
		velocity.y += gravity * delta
	else:
		if direction and direction.length() == 1.0:
			velocity = direction * SPEED
			ldir = direction
		else :
			velocity = ldir * SPEED
		
	
		
	move_and_slide()
