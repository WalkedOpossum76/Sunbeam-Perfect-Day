extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

func _ready() -> void:
	self.visible = false

func _physics_process(delta: float) -> void:
	if self.visible:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		move_and_slide()
