extends CharacterBody2D


const SPEED = 100.0
@onready var timer: Timer = $Timer

var direction = Vector2(1,0)


func _physics_process(delta: float) -> void:
	
	velocity = SPEED * direction
	
	

	move_and_slide()


func _on_timer_timeout() -> void:
	timer.start(randf_range(4,7))
	if randi_range(0,1) == 0:
		direction = Vector2([-1,1].pick_random(),0)
	else:
		direction = Vector2(0,[-1,1].pick_random())
