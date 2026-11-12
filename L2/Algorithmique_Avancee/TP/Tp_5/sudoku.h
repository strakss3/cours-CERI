/****************************************************************/
/* Auteur : S. Gueye						                    */
/* TP : Sudoku bactracking algorithm				            */
/* Date dernière maj : 24/11/2020				                */
/****************************************************************/

/****************************************************************/
/* Objectif : Classe représentant une cellule de la grille 
/****************************************************************/

#include <vector>
class cellule {
	public :
	int l; 			        		// Numéro de ligne
	int c; 			        		// Numéro de colonne
	int b; 			        		// Numéro du bloc où se situe la cellule (l,c)
	int n;			        		// Nombre de chiffres qu'il est possible initialement d'utiliser sur la cellule
	int v;							// Valeur de la cellule
	cellule(int i, int j, int v);  	// Construit la cellule de numéro de ligne i et colonne j
};


/****************************************************************/
/* Objectif : Classe permettant de lire une grille sudoku et de la résoudre
/****************************************************************/
class sudoku {
	cellule* grille[9][9];			    // La grille

public : 
	sudoku(char filename[]);		// Lecture de la grille sudoku se trouvant dans le fichier filename
	void affichage();               // Affichage de la grille
	bool solution();                // Calcul de solution
	bool backtracking(vector<cellule> C, int k);
	bool check(cellule C, int l, int c, int v);
};