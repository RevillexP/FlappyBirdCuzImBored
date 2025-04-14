extends StaticBody2D

@export var speed = 4
@export var timeToDie = 20

func _ready() -> void:
	position.y = randf_range(175,525)
	
	$DeathTimer.wait_time = timeToDie
	$DeathTimer.start()

func _physics_process(delta: float) -> void:
	position.x -= speed


func _on_death_timer_timeout() -> void:
	queue_free()
