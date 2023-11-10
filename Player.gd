extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = true


func _ready():
	$AnimationPlayer.play(("Iddle"))


func _physics_process(delta):
	# Add the gravity.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")

	velocity.x = 0
	if Input.is_action_pressed("Derecha") :
		velocity.x += 1.0 * SPEED
		$AnimationPlayer.play("andar")
		
		facing_right=true
	if Input.is_action_pressed("Izquierda"):
		velocity.x -= 1.0 * SPEED
		$AnimationPlayer.play("andar_2")
		facing_right=false
		
	move_and_slide()




func _on_area_2d_body_entered(body):
	print(" Player tocando _on_area_2d_body_entered " + body.name)
	if body.name=="Meteorito" :
		get_tree().change_scene_to_file("res://main.tscn")# Replace with function body.
	
