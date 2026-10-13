/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP Rattrapage : Quicksort						*/
/* Date dernière maj : 13/01/2020					*/
/************************************************************************/

#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

#include "tri.h"

int main(int argc,char** argv)
{
	if(argc < 2)
		cout << "Nombre d'arguments insuffisants" << endl;
	else{
		tri obj;
		ifstream file(argv[1]);
		int n;

		file >> n; 

		int* T = new int[n];
		for(int i = 0; i < n ; i++){
			file >> T[i];	
		}

		cout << "T avant tri : ";
		obj.affiche(T,0,n-1);
		obj.triRapide(T,0,n-1);
		cout << "T après tri : ";
		obj.affiche(T,0,n-1);

		file.close();
	}
	return(1);
}
