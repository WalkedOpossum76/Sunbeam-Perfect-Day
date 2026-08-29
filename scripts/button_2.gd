extends Node2D

@onready var sprite = $Sprite2D
@onready var cameraAnimation: AnimationPlayer = $"../Camera2D/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.region_rect = Rect2(0, 0, 11, 13)

func _on_button_button_down() -> void:
	sprite.region_rect = Rect2(11, 0, 11, 13)

func _on_button_button_up() -> void:
	$"../Dino Duck".animation.play("default")
	if $"../Button 1".get_children().size() >= 3:
		$"../Button 1".get_child(2).queue_free()
	if $"../Button 3".get_children().size() >= 3:
		$"../Button 3".get_child(2).queue_free()
	
	sprite.region_rect = Rect2(0, 0, 11, 13)
	$Button.disabled = true
	cameraAnimation.play("Zoom_In")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Zoom_In":
		$"../Ducky".visible = false
		$"../Dino Duck".visible = true
		$"../Tomagatchi Background/Rock Timer".start()
		$"../Tomagatchi Background/Dino Game Timer".start()
	elif anim_name == "Zoom_Out":
		$"../Ducky".visible = true
		$"../Dino Duck".visible = false
