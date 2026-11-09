/****************************************************************/
/* Auteur : S. Gueye						*/
/* TP : Hash Table						*/
/* Date dernière maj : 07/12/2020				*/
/****************************************************************/

/****************************************************************/
/****************************************************************/
class hashtable{
	int m;					// Taille de la table de hachage
	int n;					// Nombre total de mots que contient la table
	int a;					// Argument "a" de la fonction de compression
	list<string> * T;			// Table de hachage
	map<int,int> hist;			// Histogramme permettant de stocker des couples 
						// (taille t d'une liste, nombre d'entrée de T dont les listes associées ont 							// la taille t.

public : 
	hashtable(string filename1, string filename2); // Constructeur
	int h(string s);			  	// Fonction de hachage par division
	bool rechercher(string s);			// Recherche d'une chaîne s
	void inserer(string s);				// Insertion de s dans la table
	void histogramme();				// Calcul de hist
	double ecarttype();				// Calcul de la variance de la taille des listes
	void stat();					// Affichage de statistiques
};



