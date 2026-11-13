
#include "utilities.h"


/**
 * Backtracking Somme
 * Auteur  : S. Gueye
 * @param a  : tableau de n entiers
 * @param x : tableau de booléens solution du problème x[i] == true si l'élément a[i] fait partie du sous
 * du sous-ensemble dont la somme donne K 
 * @param n : nombre d'éléments de a et x
 * @param K : entier positif ou nul pour lequel on cherche un sous-ensemble d'éléments de a dont la somme donne K
 * 
 * @return true ssi il existe un sous-ensemble d'éléments de a dont la somme donne K et faux sinon
 */

bool somme(int a[], bool x[], int n, int K) {
	int sum = 0;
	for(int j = 0 ; j < n ; j++) {
		if (x[j]) sum += a[j];
	}
	if(sum == K) return true;
	for(int i = 0 ; i < n ; i++) {
		if(!x[i] && (sum + a[i] <= K)) {
			x[i] = true;
			if(somme(a, x, n, K)) return true;
			x[i] = false;
		}
	}
	return false;
}
