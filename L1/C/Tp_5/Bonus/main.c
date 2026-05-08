#include "function.h"

int main()
{
	ArrayGlace dex = createGlacedex() ;	
	Player arrayPlayers[2] = {createPlayer("Joueur 1"), createPlayer("Joueur 2")} ;
	int currentPlayer = 0 ;
	
	//chooseGlace(arrayPlayers, &dex) ;
	
	printf("\n") ;
	playerAction(arrayPlayers, &currentPlayer) ;

	return 0 ;
}
