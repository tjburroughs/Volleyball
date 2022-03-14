extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _set_disabled():
	if (self.disabled == false):
		self.disabled = true
		
func _set_enabled():
	if (self.disabled):
		self.disabled = false


func _on_VolleyBall_disableA():
	_set_disabled()


func _on_VolleyBall_disableB():
	_set_disabled()


func _on_VolleyBall_disableC():
	_set_disabled()


func _on_VolleyBall_enableA():
	_set_enabled()


func _on_VolleyBall_enableB():
	_set_enabled()


func _on_VolleyBall_enableC():
	_set_enabled()
