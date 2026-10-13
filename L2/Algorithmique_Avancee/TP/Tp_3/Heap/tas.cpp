/************************************************************************/
/* Auteur : S. Gueye							*/
/* Contrôle Continu 2 : vérifier qu'un tableau est un tas		*/
/* Date dernière maj : 06/01/2020					*/
/************************************************************************/

#include <iostream>
#include <fstream>
#include <math.h>
#include "tas.h"

using namespace std;


/****************************************/
/* Objectif : Affichage du contenu du tableau T de taille n.
/* Complexité : 0(n)
/****************************************/
void tas::affiche(int* T, int n)
{
	for(int i = 0; i < n; i++)
		cout << T[i] << " ";
}

/****************************************/
/* Objectif : Méthode itérative renvoyant vrai si le tableau T de taille n est un tas et faux sinon.
/* Complexité : 0(n)
/****************************************/
bool tas::test(int* T, int n) {
	for(int i = 0 ; 2*i+1 < n ; i++) {
		if(T[i] > T[2*i+1]) return false;
		if(T[i] > T[2*i+2] && 2*i+2 < n) return false;
	}
	return true;
}
