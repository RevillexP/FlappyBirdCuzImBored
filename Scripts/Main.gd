extends Node2D

var pipes := preload("res://Scenes/Pipes.tscn")
var pipeSpawnPoint : Marker2D
var canSpawn : bool = true

@export var pipeTime := 1.5

func _ready() -> void:
	pipeSpawnPoint = get_node("PipeSpawnPoint")

func _physics_process(delta: float) -> void:
	if canSpawn:
		canSpawn = false
		handleSpawning()
		await get_tree().create_timer(pipeTime).timeout
		canSpawn = true

func handleSpawning() -> void:
	var pipeSet = pipes.instantiate()
	add_child(pipeSet)
	pipeSet.position.x = pipeSpawnPoint.position.x

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
