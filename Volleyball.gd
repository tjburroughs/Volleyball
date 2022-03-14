extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Player = preload("res://Player.tscn")
var focus = 1
var bumpID = 0
var setID = 0
var spikeID = 0
var ID = 0
signal Select_1(ID)
signal Select_2(ID)
signal Select_3(ID)
signal disableA
signal disableB
signal disableC
signal enableA
signal enableB
signal enableC
var ShotProfile = [0, 0, 0]
var playerA = Player.instance()
var playerB = Player.instance()
var playerC = Player.instance()
var playerArray = [playerA, playerB, playerC]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Prompt the user to form a lineup
	#Calculate the attack being made
	#Make the attack
	#Calculate the responding attack
	#Make the responding attack
	#repeat
	pass

func takeTurn():
	match focus:
		1:
			bumpID = ID
			emit_signal("Select_1",ID)
			changeShotProfile(playerArray[ID-1].bumpStats)
			#signal to label 1
			#disable button A until next choice is made
			focus += 1 
		2:
			setID = ID
			emit_signal("Select_2", ID)
			changeShotProfile(playerArray[ID-1].setStats)
			match ID:
				1:
					emit_signal("enableB")
					emit_signal("enableC")
				2:
					emit_signal("enableA")
					emit_signal("enableC")
				3:
					emit_signal("enableA")
					emit_signal("enableB")
			#signal to label 2
			#disable button A until next turn
			focus += 1
		3:
			spikeID = ID
			emit_signal("Select_3",ID)
			changeShotProfile(playerArray[ID-1].spikeStats)
			print(ShotProfile)
			#signal to label 3
			#disable button A until next turn
			focus = 1

func changeShotProfile(Stats):
	for i in range(0,3):
		ShotProfile[i] += Stats[i]

func _on_A_pressed():
	ID = 1
	takeTurn()
	emit_signal("disableA")

func _on_B_pressed():
	ID = 2
	takeTurn()
	emit_signal("disableB")

func _on_C_pressed():
	ID = 3
	takeTurn()
	emit_signal("disableC")
