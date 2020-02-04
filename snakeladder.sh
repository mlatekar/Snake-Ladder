
echo "Welcome to Snake and Ladder Game"

#constant
STARTINGPOSITION=0
WINNINGPOSITION=100
NOPLAY=0
LADDER=1
SNAKE=2

#variables
noOfDicePlayed=0
playerPosition=$STARTINGPOSITION
firstPlayer=$STARTINGPOSITION
secondPlayer=$STARTINGPOSITION
flag=0

#declare dictionay
declare -A dicePlayed

#switch the player1 and player2
function switchPlayer()  
{ 
	if [[ $flag -eq 0 ]]
	then 
		noOfDicePlayed=$(( noOfDicePlayed+1 ))
		PlayerPosition=$firstPlayer
		player=1
		rollDie
		firstPlayer=$playerPosition
		flag=1
	else
		secondPlayer=$playerPosition
		playerPosition=$secondPlayer
		player=2
      rollDie
      secondPlayer=$playerPosition
      flag=0
	fi
}
#genrate number 1 to 6
function rollDie() 
{
	dieNumber=$(($((RANDOM%6))+1))
	echo "Rolls the die : "$dieNumber
	#calling option function	
	option	  
}

function option()  
{
   	case $((RANDOM%3)) in
		$NOPLAY)
			playerPosition=$playerPosition
			;;

		$LADDER)
			playerPosition=$(($playerPosition+$dieNumber))
			if [[ $playerPosition -gt $WINNINGPOSITION ]]
			then
				playerPosition=$((playerPosition-dieNumber))
			fi
			;;

		$SNAKE)
			playerPosition=$(($playerPosition-$dieNumber))
			if [ $playerPosition -lt $STARTINGPOSITION ]
	   	then
   			playerPosition=$STARTINGPOSITION
			fi
			;;
   esac
	#calling position function
	position
	echo "New position of player : " $playerPosition 
}
#player position store
function position()     
{
	dicePlayed[Player_"$player"_"$noOfDicePlayed"]=$playerPosition
}

function newPosition()
{
   while [[ $playerPosition -ne $WINNINGPOSITION ]]
   do
	#calling switchplayer function
	switchPlayer
   done
}
function winPlayer()
{
	if [[ $firstPlayer -gt $secondPlayer ]]
	then
		echo "player 1 win"
	else
		echo "Player 2 win"
	fi
}
#start program with calling functions
newPosition
winPlayer
