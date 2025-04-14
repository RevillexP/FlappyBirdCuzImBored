extends CharacterBody2D

const GRAV = 15

@export var flap_str = 500

@export var deathFX : CPUParticles2D
@export var scoreCount : Label
@export var tryAgain : Button

var score : int = 0

func _ready() -> void:
	scoreCount.text = str(score)

func _physics_process(delta: float) -> void:
	velocity.y += GRAV
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -flap_str
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	deathFX.emitting = true
	deathFX.position = position
	await get_tree().create_timer(1,true,false,true).timeout
	tryAgain.visible = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	score += 1
	scoreCount.text = str(score)
