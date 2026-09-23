#include <iostream>
#include <fstream>
#include <algorithm>
#include "ABR.h"

using namespace std;

/* 
 * Format de fichier d'insertion de clé dans l'ABR :
 * 
 * 5			<- nombre d'éléments à insérer
 * 3 2 5 8 1	<- liste des éléments
 * 5			<- élément à rechercher 
*/

int main(int argc, char** argv) {
	
	if (argc < 2) {
		
		cout << "Nombre d'arguments insuffisants" << endl;
	}
	else {
		
		ABR abr(argv[1]);
		int e = abr.getE();
		Noeud* y = abr.recherche(e);
		Noeud* z;
		
		if (y != nullptr) {
			
			cout << "Recherche  : " << e  << " a ete trouve" << endl;

			z = abr.predecesseur(y);
			
			if(z != nullptr) {
				
				cout << "Le predecesseur de " << e  << " est " << z->cle << endl;
			}
			else {
				
				cout << e  << " n'a pas de predecesseur" << endl;
			}
			z = abr.successeur(y);
			if (z != nullptr) {
				
				cout << "Le successeur de " << e  << " est " << z->cle << endl;
			}
			else {
				
				cout << e  << " n'a pas de successeur" << endl;
			}
		}
		else {
		
			cout << "Recherche  : " << e  << " n'a pas ete trouve" << endl;
		}
	}

	return 1;
}


