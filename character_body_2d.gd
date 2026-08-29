extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D

func _physics_process(delta: float) -> void:
		velocity.x = -700
		move_and_slide()
		
		if area_2d.has_overlapping_bodies():
			get_tree().reload_current_scene()
	
	
