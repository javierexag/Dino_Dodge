extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name=="Player" : 
		print("Meteorito Tocando al player") # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name=="Player" : 
		print("Meteorito Tocando al player area") # Replace with function body.
		get_tree().change_scene_to_file("res://main.tscn")
	if body.name=="Suelo" : 
		print("Meteorito Tocando al suelo area")
		queue_free()
