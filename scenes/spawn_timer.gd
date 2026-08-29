extends Timer

@export var spawn_timer = $SpawnTimer
@export var spawn_point = $Marker2D

var rocky_scene = [
	preload("res://rocky.tscn")
]


func _ready() -> void:
	randomize()
	spawn_timer.timeout.connect(spawn_cactus())
	
func spawn_rocky():
	rocky.position = spawn_point.position()
	add_child(rocky)
	
	func start_spawn_timer():
		spawn_timer.wait_time= randf_range(2.0,4.5)
		spawn_timer.start()
