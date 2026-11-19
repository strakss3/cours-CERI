
#include <iostream>
#include <fstream>
#include <stack>
#include "utilities.h"

using namespace std;


/*
 * Objectif : Affichage de la matrice d'adjacence
 * - A : matrice d'adjacence
 * - n : nombre de sommets du graphe
 */
void affichage(int A[][N], int n) {
	cout << "A = " << endl;
	for(int i = 0; i < n; i++){
		for(int j = 0; j < (n-1); j++)
			cout << A[i][j] << "\t";
		cout << A[i][n-1] << endl;		
	}
	cout << endl;
}


/*
 * Objectif : Parcours en profondeur à partir du sommet x
 * - A : matrice d'adjacence du graphe
 * - x : sommet de départ
 * - n : nombre de sommets
 * - marche : tableau contenant la liste complète des sommets visités 
 * - "marche" est rempli pendant le parcours.
 * - La fonction renvoie le nombre d'éléments se trouvant dans "marche".
 */
int parcoursprofondeur1(int A[][N], int x, int n, int marche[]) {
	int i = 0;
	marche[i++] = x;
	stack<int> open;
	open.push(x);
	while(!open.empty()) {
		int v = open.top();
		int u = -1;
		for(int j = 0 ; j < n ; j++) {
			if (A[v][j] == 0) continue;
			bool visited = false;
			for(int k = 0 ; k < i ; k++) {
				if (j == marche[k]) {
					visited = true;
					break;
				}
			}
			if(!visited) {
				u = j;
			}
		}
		if (u != -1) {
			marche[i++] = u;
			open.push(u);		
		}
		else {
			open.pop();
		}
	}
	return i;
}


/*
 * Objectif : Parcours en profondeur à partir du sommet x
 * - A : matrice d'adjacence du graphe
 * - x : sommet de départ
 * - n : nombre de sommets
 * - marche : tableau contenant la liste complète des sommets visités 
 * - "marche" est rempli pendant le parcours.
 * - La fonction renvoie le nombre d'éléments se trouvant dans "marche".
 */
int parcoursprofondeur2(int A[][N], int x, int n, int marche[]) {
	int i = 0;
	marche[i++] = x;
	stack<int> open;
	open.push(x);
	while(!open.empty()) {
		int v = open.top();
		int u = -1;
		for(int j = n-1 ; j >= 0 ; j--) {
			if (A[v][j] == 0) continue;
			bool visited = false;
			for(int k = 0 ; k < i ; k++) {
				if (j == marche[k]) {
					visited = true;
					break;
				}
			}
			if(!visited) {
				u = j;
				break;
			}
		}
		if (u != -1) {
			if (A[marche[i-1]][u] == 0) {
				int j = i-2;
				while (marche[j] != v) {
					marche[i++] = marche[j--];
				}
				marche[i++] = marche[j];
			}
			marche[i++] = u;
			open.push(u);
		}
		else {
			open.pop();
		}
	}
	return i;
}

