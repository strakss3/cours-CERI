#include <iostream>
#include <iomanip>

using namespace std;

#include "sudoku.h"


/****************************************/
/* Objectif : Construction d'une cellule
/****************************************/
cellule::cellule(int i, int j)
{
        // A FAIRE !!! (si vous choissisez d'utiliser la classe) //
}


/****************************************/
/* Objectif : Construteur avec argument 
permettant la création d'une grille à partir d'un 
fichier.
/****************************************/
sudoku::sudoku(char filename[])
{
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++)
            grille[i][j] = 0;
    }
    // A FAIRE !!! //
}


/****************************************/
/* Objectif : Affichage de la grille sudoku
/****************************************/
void sudoku::affichage()
{
	cout << setw(3) << "-" << "------------------------------------" << endl;
	for(int i = 0; i < 9; i++){
		if((i == 3) || (i == 6))
			cout << setw(3) << "-" << "------------------------------------" << endl;
		cout << setw(3) << "|";		
		for(int j = 0; j < 8; j++){
			if((j == 3) || (j == 6))
				cout << setw(3) << "|" << setw(3) << grille[i][j];
			else
				cout << setw(3) << grille[i][j];
		}
		cout << setw(3) << grille[i][8] << setw(3)<<  "|" << endl;
	}
	cout << setw(3) << "-" << "------------------------------------" << endl;
}


/****************************************/
/* Objectif : Détermination d'une solution de la grilleées.
La méthode renvoie vrai si une solution a été trouvée, 0 sinon
/****************************************/
bool sudoku::solution()
{
    // A FAIRE !!! //
	return(true);
}
