/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Arbres Binaires	de Recherche					*/
/* Date dernière maj : 05/11/2019					*/
/************************************************************************/
#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

#include "ABR.h"

int main(int argc, char** argv) {
	
	if (argc < 2) {
		
		cout << "Nombre d'arguments insuffisants" << endl;
	}
	else {
		
		ABR abr(argv[1]);
		int e = abr.gete();
		Noeud* y = abr.recherche(e);
		Noeud* z;
		
		if (y) {
			
			cout << "Recherche  : " << e  << " a été trouvé" << endl;

			z = abr.successeur(y);
			if (z) {
				
				cout << "Le successeur de " << e  << " est " << z->cle << endl;
			}
			else {
				
				cout << e  << " n'a pas de successeur" << endl;
			}
			z = abr.predecesseur(y);

			if(z) {

				cout << "Le predecesseur de " << e  << " est " << z->cle << endl;
			}
			else {
				
				cout << e  << " n'a pas de predecesseur" << endl;
			}
		}
		else {
		
			cout << "Recherche  : " << e  << " n'a pas été trouvé" << endl;
		}
	}

	return 1;
}
