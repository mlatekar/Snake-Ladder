echo "Welcome to Snake and Ladder Game"
STARTINGPOSITION=0
singlePlayerPosition=0
WINNINGPOSITION=100
noOfDicePlayed=0
declare -A dicePlayed
function rollDie()
{
dieNumber=$(($((RANDOM%6))+1))
echo "Rolls the die : "$dieNumber
((noOfDicePlayed++))
}
function newPosition()
{
	#rollDie
while [[ $singlePlayerPosition -lt $WINNINGPOSITION ]]
do
	rollDie
	case $((RANDOM%3)) in
		0)
		singlePlayerPosition=$singlePlayerPosition
		;;
		1)
		previousPosition=$singlePlayerPosition
		singlePlayerPosition=$(($singlePlayerPosition+$dieNumber))
			if [[ $singlePlayerPosition -gt $WINNINGPOSITION ]]
			  then
				singlePlayerPosition=$previousPosition
			  fi
		;;		2)
		singlePlayerPosition=$(($singlePlayerPosition-$dieNumber))
		    	
		if [ $singlePlayerPosition -lt 0 ]
	   	  then
		   	singlePlayerPosition=$STARTINGPOSITION
		 fi
		;;
esac
		dicePlayed[$noOfDicePlayed]=$singlePlayerPosition
		echo ${dicePlayed[noOfDicePlayed]}
	
echo "New position of player : " $singlePlayerPosition
echo "dice roll time : " ${dicePlayed[@]}
done
}
newPosition
