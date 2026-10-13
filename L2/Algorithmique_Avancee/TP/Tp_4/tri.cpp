/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Tri par dénombrement						*/
/* Date dernière maj : 10/12/2019					*/
/************************************************************************/

#include <iostream>
#include <fstream>
#include <algorithm>
#include <vector>
#include "tri.h"

using namespace std;

/****************************************/
/* Objectif : Constructeur
/* Complexité : 0(n)
/****************************************/
tri::tri(char* filename){
	ifstream file(filename);

	file >> n;
	file >> k;  

	T = new int[n];	

	for(int i = 0; i < n ; i++)
		file >> T[i];	
	
	file.close();
}


/****************************************/
/* Objectif : Affiche
/* Complexité : 0(n)
/****************************************/
void tri::affiche()
{
	for(int i = 0; i < n; i++)
		cout << " " <<  T[i];
	cout << endl;
}

/****************************************/
/* Objectif : Tri
/* Complexité : 0(n + k)
/****************************************/
void tri::triDenombrement()
{
	vector<int> C(k+1, 0);
	for(int i = 0 ; i < n ; i++) {
		C[T[i]]++;
	}
	int j = 0;
	for(int i = 0 ; i < k+1 ; i++) {
		while(C[i] > 0) {
			T[j] = i;
			j++;
			C[i]--;
		}
	}
}
