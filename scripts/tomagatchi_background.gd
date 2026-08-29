extends Sprite2D

@onready var clouds = [$"Cloud 1", $"Cloud 2", $"Cloud 3"]
@onready var timer = $Timer

@onready var tween1 = create_tween().set_parallel(true)
@onready var tween2 = create_tween().set_parallel(true)
@onready var tween3 = create_tween().set_parallel(true)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in clouds.size():
		clouds[i].position.x = -30 + (randi_range(0, 1)*60)
		clouds[i].position.y = randf_range(-9.5, -0.5)
		clouds[i].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	
	tween1.finished.connect(_kill_tween1)
	tween2.finished.connect(_kill_tween2)
	tween3.finished.connect(_kill_tween3)
	
	tween1.kill()
	tween2.kill()
	tween3.kill()
	
	timer.start()

func _kill_tween1():
	clouds[0].position.x = -30 + (randi_range(0, 1)*60)
	clouds[0].position.y = randf_range(-9.5, -0.5)
	clouds[0].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	tween1.kill()

func _kill_tween2():
	clouds[1].position.x = -30 + (randi_range(0, 1)*60)
	clouds[1].position.y = randf_range(-9.5, -0.5)
	clouds[1].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	tween2.kill()

func _kill_tween3():
	clouds[2].position.x = -30 + (randi_range(0, 1)*60)
	clouds[2].position.y = randf_range(-9.5, -0.5)
	clouds[2].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	tween3.kill()


func _on_timer_timeout() -> void:
	print("move cloud")
	if !tween1.is_running():
		tween1 = create_tween().set_parallel(true)
		tween1.finished.connect(_kill_tween1)
		tween1.tween_property(clouds[0], "position:x", -clouds[0].position.x, randf_range(3.0, 7.0))
	elif !tween2.is_running():
		tween2 = create_tween().set_parallel(true)
		tween2.finished.connect(_kill_tween3)
		tween2.tween_property(clouds[1], "position:x", -clouds[1].position.x, randf_range(3.0, 7.0))
	elif !tween3.is_running():
		tween3 = create_tween().set_parallel(true)
		tween3.finished.connect(_kill_tween3)
		tween3.tween_property(clouds[2], "position:x", -clouds[2].position.x, randf_range(3.0, 7.0))
			
	
	timer.wait_time = randf_range(0.25, 5)
