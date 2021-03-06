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
var attackShot = 0

# Controllable players
var playerA = load('res://Player.gd').new('Player A')
var playerB = load('res://Player.gd').new('Player B')
var playerC = load('res://Player.gd').new('Player C')

# NPCs
var player1 = load('res://Player.gd').new('Player 1')
var player2 = load('res://Player.gd').new('Player 2')
var player3 = load('res://Player.gd').new('Player 3')

# Called when the node enters the scene tree for the first time.
func _ready():
	seed(6)
	initPlayerStats()
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
		print(attackShot)
		calculateDefense()
		emit_signal("enableA")
		emit_signal("enableB")
		emit_signal("enableC")
		focus = 1
		attackShot = 0
	pass

func initPlayerStats():
	playerA.addStats(1,2,3)
	playerB.addStats(10,20,30)
	playerC.addStats(100,200,300)

	player1.addStats(1,2,3)
	player2.addStats(10,20,30)
	player3.addStats(100,200,300)


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
	attackShot += stat

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


func calculateDefense():
	var IDs = [player1, player2, player3]
	var opponentBumpID = IDs.pop_at(randi() % 3)
	var opponentSetID = IDs.pop_at(randi() % 2)
	var opponentSpikeID = IDs.pop_at(0)

	var defenseShot = opponentBumpID.bumpStat + opponentSetID.setStat + opponentSpikeID.spikeStat
	print('Defense hit with:')
	print(defenseShot)
	if (attackShot > defenseShot):
		print('You won!')
	else:
		print('Defense hit ball, returning...')
