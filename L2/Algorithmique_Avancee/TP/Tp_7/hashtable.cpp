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

/****************************************/
/* Objectif : Construction de la classe
/* Il prend deux arguments :
/* - fllename1 : le fichier contenant la taille m de la table et, 
la valeur du paramètre (a) de la fonction de compression
/* - filename2 : le fichier contenant les mots servant de clés (anglais.mots)
/* Il doit ouvrir filename1 pour obtenir m et a puis ouvrir filename2 où chaque mot est lû un à un
et inséré dans la table de hachage T par la méthode d'insertion (à faire aussi).
/****************************************/
hashtable::hashtable(string filename1, string filename2)
{
	// !!! A FAIRE !!! //
}


/****************************************/
/* Objectif : Hachage de s qui se passe en deux étapes.
/* 1. Calcul de la valeur entière de s avec la fonction de compression
/* 2. Le résultat à retourner est la division modulo m de cette valeur
/****************************************/
int hashtable::h(string s)
{
	// !!! A FAIRE !!! //

	return(0);
}


/****************************************/
/* Objectif : 
/* Histogramme (voir description TP)
/* La méthode doit remplir la map "hist".
/* hist[x] contient le nombre d'entrées du tableau T
/* dont la taille des listes associées est x.
/****************************************/
void hashtable::histogramme()
{
	// !!! A FAIRE !!! //
}


/****************************************/
/* Objectif : Calcul de la variance des tailles des listes
par rapport à la moyenne n/m.
/****************************************/
double hashtable::ecarttype()
{
	// !!! A FAIRE !!! //
	return(-1);		
}


/****************************************/
/* Objectif : 
/* Affichage des éléments statistiques calculés
/****************************************/
void hashtable::stat()
{
	map<int,int>::iterator it;

	for (it=hist.begin(); it!=hist.end(); ++it)
		cout << "Le nombre d'entrées contenant " << it->first << " éléments est = " << it->second << endl;

	cout << "L'écart type = " << ecarttype() << endl;
}


/****************************************/
/* Objectif : 
/* Insertion de s dans la table
/* s n'est inséré que s'il n'existe pas déjà
/****************************************/
void hashtable::inserer(string s)
{
	// !!! A FAIRE !!! //
}

/****************************************/
/* Objectif : 
/* Recherche de la chaîne s 
/* La méthode renvoie "vrai" si s existe dans la table
/* "faux" sinon.
/****************************************/
bool hashtable::rechercher(string s)
{
	// !!! A FAIRE !!! //	
	return(false);
}
