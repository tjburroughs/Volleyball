extends Node

class_name Player

var bumpStat
var setStat
var spikeStat

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(playerName, bump, set, spike):
	self.name = playerName
	self.bumpStat = bump
	self.setStat = set
	self.spikeStat = spike



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
