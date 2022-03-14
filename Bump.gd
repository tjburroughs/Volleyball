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
	if (signal == 0):
		text = "Bump"
	elif (signal == 1):
		text = "Player A"
	elif (signal == 2):
		text = "Player B"
	elif (signal == 3):
		text = "Player C"


func _on_VolleyBall_Select_1(ID):
	signal = ID
