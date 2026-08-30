extends Node2D

@onready var sprite = $Sprite2D
@onready var cameraAnimation: AnimationPlayer = $"../Camera2D/AnimationPlayer"

var heartTween = create_tween().set_parallel(true)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.region_rect = Rect2(0, 0, 11, 13)

func _on_button_button_down() -> void:
	sprite.region_rect = Rect2(11, 0, 11, 13)

func _on_button_button_up() -> void:
	sprite.region_rect = Rect2(0, 0, 11, 13)
	if self.get_children().size() >= 3:
		get_child(2).queue_free()
	if heartTween.is_running():
		heartTween.kill()
	var heart = Sprite2D.new()
	heart.texture = load("res://sprites/Heart1.png")
	heart.scale = Vector2(2.5, 2.5)
	heart.z_index = -1
	add_child(heart)
	heart.global_position = Vector2(576, 264)
	
	heartTween = create_tween().set_parallel(true)
	heartTween.set_trans(Tween.TRANS_SINE)
	heartTween.set_ease(Tween.EASE_OUT)
	heartTween.finished.connect(_delete)
	heartTween.tween_property(heart, "global_position", Vector2(randf_range(432, 704), 250), 3)

func _delete():
	heartTween.kill()
