#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;

#include "sudoku.h"


/****************************************/
/* Objectif : Construction d'une cellule
/****************************************/
cellule::cellule(int i, int j, int v) {
    this->c = j;
    this->l = i;
    this->b = 3*(i/3) + (j/3);
    this->n = 9;
	this->v = v;
}


/****************************************/
/* Objectif : Construteur avec argument 
permettant la création d'une grille à partir d'un 
fichier.
/****************************************/
sudoku::sudoku(char filename[]) {
	ifstream file(filename);
	for (int i = 0; i < 9; i++) {        // i = ligne
		for (int j = 0; j < 9; j++) {    // j = colonne
			int v;
			file >> v;
			grille[i][j] = new cellule(i, j, v);
		}
	}
}

/****************************************/
/* Objectif : Affichage de la grille sudoku
/****************************************/
void sudoku::affichage() {
	cout << setw(3) << "-" << "------------------------------------" << endl;
	for(int i = 0; i < 9; i++){
		if((i == 3) || (i == 6))
			cout << setw(3) << "-" << "------------------------------------" << endl;
		cout << setw(3) << "|";		
		for(int j = 0; j < 8; j++){
			if((j == 3) || (j == 6))
				cout << setw(3) << "|" << setw(3) << grille[i][j]->v;
			else
				cout << setw(3) << grille[i][j]->v;
		}
		cout << setw(3) << grille[i][8]->v << setw(3)<<  "|" << endl;
	}
	cout << setw(3) << "-" << "------------------------------------" << endl;
}


/****************************************/
/* Objectif : Détermination d'une solution de la grilleées.
La méthode renvoie vrai si une solution a été trouvée, 0 sinon
/****************************************/
bool sudoku::solution() {
	vector<cellule> C;
	for(int i = 0 ; i < 9 ; i++) {
		for(int j = 0 ; j < 9 ; j++) {
			if(this->grille[i][j]->v == 0) {
				C.push_back(*this->grille[i][j]);
			}
		}
	}

	return backtracking(C, 0);
}

bool sudoku::check(cellule C, int l, int c, int v) {
	for(int i = 0 ; i < 9 ; i++) {
		if(this->grille[i][c]->v == v) return false;
	}
	for(int i = 0 ; i < 9 ; i++) {
		if(this->grille[l][i]->v == v) return false;
	}
	for(int i = 0 ; i < 3 ; i++) {
		for(int j = 0 ; j < 3 ; j++) {
			if(this->grille[l-l%3+i][c-c%3+j]->v == v) return false;
		}
	}
	return true;
}

bool sudoku::backtracking(vector<cellule> C, int k) {
	
	if(k >= (int)C.size()) return true;
	for(int j = 1 ; j < 10 ; j++) {
		if (this->check(C[k], C[k].l, C[k].c, j)) {
			int tmp = this->grille[C[k].l][C[k].c]->v;
			this->grille[C[k].l][C[k].c]->v = j;
			if (backtracking(C, k+1)) return true;
			this->grille[C[k].l][C[k].c]->v = tmp;
		}
	}
	return false;
}