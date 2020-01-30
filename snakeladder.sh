echo "Welcome to Snake and Ladder Game"
singlePlayerPosition=0
dieNumber=$(($((RANDOM%6))+1))
echo "Rolls the die :" $dieNumber

function newPosition()
{
	case $((RANDOM%3)) in
		0)
		singlePlayerPosition=$singlePlayerPosition
		;;
		1)
		singlePlayerPosition=$(($singlePlayerPosition+$dieNumber))
		;;
		2)
		singlePlayerPosition=$(($singlePlayerPosition-$dieNumber))
		;;
	esac
echo "New position of player : " $singlePlayerPosition
}
newPosition

