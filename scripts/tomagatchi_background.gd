extends Sprite2D

@onready var clouds = [$"Cloud 1", $"Cloud 2", $"Cloud 3"]
@onready var rocks = [$"Rocky 1", $"Rocky 2", $"Rocky 3"]
@onready var cloudTimer = $"Cloud Timer"
@onready var rockTimer = $"Rock Timer"
@onready var dinoGameTimer = $"Dino Game Timer"

@onready var rockTween1 = create_tween().set_parallel(true)
@onready var rockTween2 = create_tween().set_parallel(true)
@onready var rockTween3 = create_tween().set_parallel(true)

@onready var cloudTween1 = create_tween().set_parallel(true)
@onready var cloudTween2 = create_tween().set_parallel(true)
@onready var cloudTween3 = create_tween().set_parallel(true)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in clouds.size():
		clouds[i].position.x = -30 + (randi_range(0, 1)*60)
		clouds[i].position.y = randf_range(-9.5, -0.5)
		clouds[i].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	
	cloudTween1.finished.connect(_kill_tween1)
	cloudTween2.finished.connect(_kill_tween2)
	cloudTween3.finished.connect(_kill_tween3)
	
	rockTween1.finished.connect(_kill_rock1)
	rockTween3.finished.connect(_kill_rock2)
	rockTween3.finished.connect(_kill_rock3)
	
	cloudTween1.kill()
	cloudTween2.kill()
	cloudTween3.kill()
	
	rockTween1.kill()
	rockTween2.kill()
	rockTween3.kill()
	
	cloudTimer.start()

func _kill_rock1():
	rocks[0].position.x = 26.955 
	rockTween1.kill()

func _kill_rock2():
	rocks[1].position.x = 26.955
	rockTween2.kill()

func _kill_rock3():
	rocks[2].position.x = 26.955
	rockTween3.kill()

func _kill_tween1():
	clouds[0].position.x = -30 + (randi_range(0, 1)*60)
	clouds[0].position.y = randf_range(-9.5, -0.5)
	clouds[0].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	cloudTween1.kill()

func _kill_tween2():
	clouds[1].position.x = -30 + (randi_range(0, 1)*60)
	clouds[1].position.y = randf_range(-9.5, -0.5)
	clouds[1].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	cloudTween2.kill()

func _kill_tween3():
	clouds[2].position.x = -30 + (randi_range(0, 1)*60)
	clouds[2].position.y = randf_range(-9.5, -0.5)
	clouds[2].region_rect = Rect2(15*randi_range(0, 3), 6*randi_range(0, 1), 15, 6)
	cloudTween3.kill()

func _on_timer_timeout() -> void:
	if !cloudTween1.is_running():
		cloudTween1 = create_tween().set_parallel(true)
		cloudTween1.finished.connect(_kill_tween1)
		cloudTween1.tween_property(clouds[0], "position:x", -clouds[0].position.x, randf_range(3.0, 7.0))
	elif !cloudTween2.is_running():
		cloudTween2 = create_tween().set_parallel(true)
		cloudTween2.finished.connect(_kill_tween3)
		cloudTween2.tween_property(clouds[1], "position:x", -clouds[1].position.x, randf_range(3.0, 7.0))
	elif !cloudTween3.is_running():
		cloudTween3 = create_tween().set_parallel(true)
		cloudTween3.finished.connect(_kill_tween3)
		cloudTween3.tween_property(clouds[2], "position:x", -clouds[2].position.x, randf_range(3.0, 7.0))
			
	
	cloudTimer.wait_time = randf_range(0.25, 5)


func _on_rock_timer_timeout() -> void:
	if !rockTween1.is_running():
		rockTween1 = create_tween().set_parallel(true)
		rockTween1.finished.connect(_kill_rock1)
		rockTween1.tween_property(rocks[0], "position:x", -26.955, 2)
	elif !rockTween2.is_running():
		rockTween2 = create_tween().set_parallel(true)
		rockTween2.finished.connect(_kill_rock2)
		rockTween2.tween_property(rocks[1], "position:x", -26.955, 2)
	elif !rockTween3.is_running():
		rockTween3 = create_tween().set_parallel(true)
		rockTween3.finished.connect(_kill_rock3)
		rockTween3.tween_property(rocks[2], "position:x", -26.955, 2)
			
	
	rockTimer.wait_time = randf_range(1, 3)

func _on_dino_game_timer_timeout() -> void:
	rockTimer.stop()
	dinoGameTimer.stop()
	rockTween1.kill()
	rockTween2.kill()
	rockTween3.kill()
	$"Rocky 1".position.x = 26.955
	$"Rocky 2".position.x = 26.955
	$"Rocky 3".position.x = 26.955
	$"../Dino Duck".animation.stop()
	$"../Camera2D/AnimationPlayer".play("Zoom_Out")
	
