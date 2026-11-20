#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <list>
#include <string>
#include <iterator> 
#include <math.h>
#include <map>

using namespace std;

#include "hashtable.h"

/*
 * Objectif : Construction de la classe
 * Il prend deux arguments :
 * - fllename1 : le fichier contenant la taille m de la table et, 
 * la valeur du parametre (a) de la fonction de compression
 * - filename2 : le fichier contenant les mots servant de cles (anglais.mots)
 * Il doit ouvrir filename1 pour obtenir m et a puis ouvrir filename2 où chaque mot est lû un a un
 *et insere dans la table de hachage T par la methode d'insertion (a faire aussi).
*/
hashtable::hashtable(string filename1, string filename2) {
	ifstream file1(filename1);
	file1 >> m;
	file1 >> a;
	file1.close();

	T = new list<string>[m];
	ifstream file2(filename2);
	string word;
	file2 >> word;
	while(!file2.eof()) {
		file2 >> word;
		inserer(word);
		n++;
	}
	file2.close();
}

/*
 * Objectif : Hachage de s qui se passe en deux etapes.
 * 1. Calcul de la valeur entiere de s avec la fonction de compression
 * 2. Le resultat a retourner est la division modulo m de cette valeur
 */
int hashtable::h(string s) {
	int k = 0;
	int p = 1;
	for(unsigned char c : s) {
		k = (k + c * p) % m;
		p = (p * a) % m;
	}
	return k;
}

/*
 * Objectif : 
 * Histogramme (voir description TP)
 * La methode doit remplir la map "hist".
 * hist[x] contient le nombre d'entrees du tableau T
 * dont la taille des listes associees est x.
 */
void hashtable::histogramme() {
	for(int i = 0 ; i < m ; i++) {
		hist[T[i].size()] += 1;
	}
}

/*
 * Objectif : Calcul de la variance des tailles des listes
 * par rapport a la moyenne n/m.
 */
double hashtable::ecarttype() {
	double sum = 0;
	for(int i = 0 ; i < m ; i++) {
		sum += (T[i].size() - n/m) * (T[i].size() - n/m);
	}
	return sqrt(sum/5);
}

/*
 * Objectif : 
 * Affichage des elements statistiques calcules
 */
void hashtable::stat() {
	map<int,int>::iterator it;
	for (it=hist.begin(); it!=hist.end(); ++it) {
		cout << "Le nombre d'entrees contenant " << it->first << " elements est = " << it->second << endl;
	}
	cout << "L'ecart type = " << ecarttype() << endl;
}

/*
 * Objectif : 
 * Insertion de s dans la table
 * s n'est insere que s'il n'existe pas deja
 */
void hashtable::inserer(string s) {
	if (rechercher(s)) return;
	T[h(s)].push_back(s);
}

/*
 * Objectif : 
 * Recherche de la chaîne s 
 * La methode renvoie "vrai" si s existe dans la table
 * "faux" sinon.
 */
bool hashtable::rechercher(string s) {
	for(auto word : T[h(s)]) {
		if (word == s) return true;
	}
	return false;
}
