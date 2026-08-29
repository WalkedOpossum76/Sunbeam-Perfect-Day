extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -150.0
const LEAN_DEGREE = 15.0
const LEAN_TIME = 2.0

@onready var leanLeft = true
@onready var tween = create_tween().set_parallel(true)

func lean():
	leanLeft = !leanLeft
	
	tween.kill()
	tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.finished.connect(_move_back)
	
	if leanLeft:
		tween.tween_property(self, "rotation_degrees", -LEAN_DEGREE, LEAN_TIME)
	else:
		tween.tween_property(self, "rotation_degrees", LEAN_DEGREE, LEAN_TIME)

func _move_back():
	tween.kill()
	tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 0, 5.0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		lean()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
