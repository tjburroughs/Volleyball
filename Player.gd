extends Node

class_name Player

var stat1
var stat2
var stat3
var bumpStat
var setStat
var spikeStat

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(playerName):
	self.name = playerName

func addStats(stat1, stat2, stat3):
	self.stat1 = stat1
	self.stat2 = stat2
	self.stat3 = stat3
	self.bumpStat = 0.5*stat1 + 0.25*stat2 + 0.25*stat3
	self.setStat = 0.25*stat1 + 0.5*stat2 + 0.25*stat3
	self.spikeStat = 0.25*stat1 + 0.25*stat2 + 0.5*stat3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
