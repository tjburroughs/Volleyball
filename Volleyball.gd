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
var shotProfile = 0

var playerA = load('res://Player.gd').new('Player A',1,2,3)
var playerB = load('res://Player.gd').new('Player B',10,20,30)
var playerC = load('res://Player.gd').new('Player C',100,200,300)

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
	if (focus > 3):
		print('You hit the ball with:')
		print(shotProfile)
		emit_signal("enableA")
		emit_signal("enableB")
		emit_signal("enableC")
		focus = 1
		shotProfile = 0
	pass

func takeTurn(ID):
	match focus:
		1:
			bumpID = ID
			emit_signal("Select_1",ID)
			addToShot(ID.bumpStat)
			#signal to label 1
			#disable button A until next choice is made
			focus += 1 
		2:
			setID = ID
			emit_signal("Select_2", ID)
			addToShot(ID.setStat)
			# This can be done better, but i cba
			match bumpID.name:
				'Player A':
					emit_signal("enableA")
				'Player B':
					emit_signal("enableB")
				'Player C':
					emit_signal("enableC")
			#signal to label 2
			#disable button A until next turn
			focus += 1
		3:
			spikeID = ID
			emit_signal("Select_3",ID)
			addToShot(ID.spikeStat)
			#signal to label 3
			#disable button A until next turn
			focus += 1

func addToShot(stat):
	shotProfile += stat

func _on_A_pressed():
	ID = playerA
	takeTurn(ID)
	emit_signal("disableA")

func _on_B_pressed():
	ID = playerB
	takeTurn(ID)
	emit_signal("disableB")

func _on_C_pressed():
	ID = playerC
	takeTurn(ID)
	emit_signal("disableC")
