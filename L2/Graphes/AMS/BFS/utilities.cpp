
#include <iostream>
#include <fstream>
#include <queue>
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
 * Objectif : Affichage des distance d'un sommet origine x d'un graphe
 * de n sommets à tous les autres.
 * Ces distances sont stockés dans le tableau d.
 * - d[i] est la distance de x à i
 * Rappel : La distance est la longueur d'un plus court chemin de x à i (voir TD1)
 * Elle est obtenue en faisant un parcours en largeur du graphe.
 */
void affichage(int x, int n, int d[]) {
	cout << "La distance du sommet " << x << "  " << endl;
	for(int i = 0; i < n; i++) {
		cout <<"- au sommet " << i << " = " << d[i] << endl;
	}
}

/*
 * Objectif : Calcul des distances d'un sommet origine x vers tous les autres 
 * sommets d'un graphe simple.
 * - A : matrice d'adjacence du graphe
 * - x : sommet de départ
 * - n : nombre de sommets
 * - d : tableau des distances à trouver
 * Pour chaque sommet i, d[i] doit contenir contient la distance de x à i SI on peut atteindre i à partir de x
 * Si i n'est pas atteignable depuis x alors d[i] doit être égale à -1.
 * Dans le tableau pred, pred[x] = x comme en cours.
 */
void distances(int A[][N], int x, int n, int d[N]) {
	for(int i = 0 ; i < n ; i++) d[i] = -1;
	d[x] = 0;
	queue<int> open;
	open.push(x);
	while(!open.empty()) {
		int v = open.front();
		for(int u = 0 ; u < n ; u++) {
			if (A[v][u] == 0) continue;
			if (d[u] != -1) continue;
			d[u] = d[v] + 1;
			open.push(u);
		}
		open.pop();
	}
}

/*
 * Objectif : Calcul de l'excentricité du noeud i d'un graphe 
 * representé par la matrice d'adjacence A. 
 * - A : matrice d'adjacence du graphe
 * - n : nombre de sommets
 * - La fonction renvoie l'excentricité de i
 */
int excentricite(int A[][N], int i, int n) {
	int d[N];
	int max = 0;
	distances(A, i, n, d);
	for(int i = 0 ; i < n ; i++) {
		if (d[i] > max) max = d[i];
	}
	return max;
}

/*
 * Objectif : Calcul du diamètre d'un graphe representé par la matrice d'adjacence A. 
 * - A : matrice d'adjacence du graphe
 * - n : nombre de sommets
 * - La fonction renvoie le diamètre
 */
int diametre(int A[][N], int n) {
	int exc;
	int max = 0;
	for(int i = 0 ; i < n ; i++) {
		exc = excentricite(A, i, n);
		if(exc > max) max = exc;
	}
	return max;
}

/*
 * Objectif : Calcul du rayon d'un graphe representé 
 * par la matrice d'adjacence A. 
 * - A : matrice d'adjacence du graphe
 * - n : nombre de sommets
 * - La fonction renvoie le rayon
 */
int rayon(int A[][N], int n) {
	int exc = excentricite(A, 0, n);
	int min = exc;
	for(int i = 1 ; i < n ; i++) {
		exc = excentricite(A, i, n);
		if(exc < min) min = exc;
	}
	return min;
}

/*
 * Objectif : i et j sont des noeuds.
 * Si l'arête (i,j) existe alors :
 * - La fonction renvoie la longueur minimale d'un cycle contenant (i,j)
 * ou 0 si aucun cycle ne contient (i,j).
 * Si l'arête n'existe pas la fonction renvoie -1
 * - A : matrice d'adjacence du graphe
 * - n : nombre de sommets
 */
int cycle(int A[][N], int i, int j, int n) {
	if(A[i][j] == 0) return -1;
	A[i][j] = 0;
	int d[n];
	for(int k = 0 ; k < n ; k++) d[k] = -1;
	d[i] = 0;
	queue<int> open;
	open.push(i);
	while(!open.empty()) {
		int v = open.front();
		for(int u = 0 ; u < n ; u++) {
			if (A[v][u] == 0) continue;
			if (d[u] != -1) continue;
			d[u] = d[v] + 1;
			open.push(u);
		}
		open.pop();
	}
	return d[j] + 1;
}

/* ----| A FAIRE !! |----
 * Objectif : Calcul de la circonférence du graphe
 * Si le graphe ne contient aucun cycle alors la circonference 
 * renvoyée doit être 0.
 * - A : matrice d'adjacence du graphe
 * - n : nombre de sommets
 */
void backtrack(int A[][N], int start, int current, int depth, int visited[], int &maximum, int n) {
	for(int next = 0 ; next < n ; next++) {
		if(A[current][next] == 0) continue;

		if(next == start) {
			if(depth >= 3 && depth > maximum) {
				maximum = depth;
			}
		}
		else if(next >= start && !visited[next]) {
			visited[next] = 1;
			backtrack(A, start, next, depth + 1, visited, maximum, n);
			visited[next] = 0;
		}
	}
}

int circonference(int A[][N], int n) {
	int maximum = 0;
	int visited[N];

	for(int start = 0; start < n; start++) {
		for(int i = 0; i < n; i++) {
			visited[i] = 0;
		}
		visited[start] = 1;
		backtrack(A, start, start, 1, visited, maximum, n);
	}

	return maximum;
}
