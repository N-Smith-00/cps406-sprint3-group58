extends "res://Scripts/kill_zone.gd"

func _on_body_entered(body: Node2D) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	print_debug("i hit somthing")
	if area.is_in_group("Trail"):
		print("you died")
		Engine.time_scale = 0.5
		timer.start()
