/************************************************************************/
/* Auteur : S. Gueye							*/
/* Contrôle Continu 2 : vérifier qu'un tableau est un tas		*/
/* Date dernière maj : 06/01/2020					*/
/************************************************************************/
#include <iostream>
#include <fstream>

using namespace std;

#include "tas.h"

int main()
{
	int T1[10] = {15, 32, 36, 10, 8, 3, 9, 8, 13, 20};
	int T2[10] = {2, 6, 10, 8, 9, 11, 12, 9, 13, 14};

	tas heap;

	cout << "T1 = ";
	heap.affiche(T1,10);
	if(heap.test(T1,10))
		cout << " est un tas" << endl;
	else
		cout << " n'est pas un tas" << endl;

	cout << "T2 = ";
	heap.affiche(T2,10);
	if(heap.test(T2,10))
		cout << " est un tas" << endl;
	else
		cout << " n'est pas un tas" << endl;

	return(1);
}
