/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP Rattrapage : Tri rapide						*/
/* Date dernière maj : 13/01/2020					*/
/************************************************************************/

#include <iostream>
#include <fstream>
#include <algorithm>
#include "tri.h"

using namespace std;


/****************************************/
/* Objectif : Echange
/* Complexité : 0(1)
/****************************************/
void tri::echange(int &a, int &b) {
	int tmp = a;
	a = b;
	b = tmp;
}


/****************************************/
/* Objectif : Partionnement
/* Complexité : 0(n)
/****************************************/
void tri::affiche(int *T, int a, int b) {
	cout << "T =";
	for(int i = a; i <= b; i++)
		cout << " " <<  T[i];
	cout << endl;
}

/****************************************/
/* Objectif : Partionnement
/* Complexité : 0(n)
/****************************************/
int tri::partitionnement(int *T, int a, int b) {
	int l = a+1;
	int k = b;
	while(l <= k) {
		while(T[l] <= T[a]) {
			l++;
		}
		while(T[k] > T[a]) {
			k--;
		}
		if (l < k) {
			int temp = T[l];
			T[l] = T[k];
			T[k] = temp;
			l++;
			k--;
		}
	}
	int temp = T[a];
	T[a] = T[k];
	T[k] = temp;
	return k;
}


/****************************************/
/* Objectif : Tri Rapide
/****************************************/
void tri::triRapide(int *T, int a, int b) {
	if(a < b){
		int m = partitionnement(T,a,b);
		triRapide(T, a, m-1);
		triRapide(T, m+1, b);
	}
}
