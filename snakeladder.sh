3
echo "Welcome to Snake and Ladder Game"
#constant
STARTINGPOSITION=0
WINNINGPOSITION=100
NOPLAY=0
LADDER=1
SNAKE=2

#variables
noOfDicePlayed=0
singlePlayerPosition=$STARTINGPOSITION
firstPlayer=$STARTINGPOSITION
secondPlayer=$STARTINGPOSITION
flag=0

#declare dictionay
declare -A dicePlayed


function switchPlayer()  #switch the player1 and player2
{ 
	if [[ $flag -eq 0 ]]
	then 
		noOfDicePlayed=$(( noOfDicePlayed+1 ))
		singlePlayerPosition=$firstPlayer
		player=1
		rollDie
		firstPlayer=$singlePlayerPosition
		flag=1
	else
		secondPlayer=$singlePlayerPosition
		singlePlayerPosition=$secondPlayer
		player=2
      rollDie
      secondPlayer=$singlePlayerPosition
      flag=0
	fi
}

function rollDie()  # genrate number 1 to 6
{
	dieNumber=$(($((RANDOM%6))+1))
	echo "Rolls the die : "$dieNumber
	option	 #calling option function 
}

function option()  
{
	case $((RANDOM%3)) in
		$NOPLAY)
					singlePlayerPosition=$singlePlayerPosition
					;;

		$LADDER)
					singlePlayerPosition=$(($singlePlayerPosition+$dieNumber))
						if [[ $singlePlayerPosition -gt $WINNINGPOSITION ]]
			  				then
								singlePlayerPosition=$((singlePlayerPosition-dieNumber))
		   			fi
					;;

		$SNAKE)
					singlePlayerPosition=$(($singlePlayerPosition-$dieNumber))
		 				if [ $singlePlayerPosition -lt $STARTINGPOSITION ]
	   	  				then
		   					singlePlayerPosition=$STARTINGPOSITION
		 				fi
					;;
   esac
	position

   echo "New position of player : " $singlePlayerPosition
}

function position()
{
	dicePlayed[Player_"$player"_"$noOfDicePlayed"]=$singlePlayerPosition
}

function newPosition()
{
   while [[ $singlePlayerPosition -ne $WINNINGPOSITION ]]
   	do
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
newPosition
winPlayer
