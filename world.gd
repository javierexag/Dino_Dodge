extends Node2D

var elapsed_time = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	var hours = int(elapsed_time / 3600)
	var minutes = int((fmod(elapsed_time , 3600) / 60))
	var seconds = int(fmod(elapsed_time , 60))
	var time_string = "%02d:%02d:%02d" % [hours, minutes, seconds]
	$Label.text = time_string
