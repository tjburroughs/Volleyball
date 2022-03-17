extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var signal = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (signal is Player):
		text = signal.name
	elif (signal == 0):
		text = "Set"
	else:
		print('ERROR')


func _on_VolleyBall_Select_2(ID):
	signal = ID
