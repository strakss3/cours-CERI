#include <iostream>
#include <fstream>
#include "ABR.h"

using namespace std;


Noeud::Noeud(int x) {
	/*
	 * Constructeur d'un Noeud dont les fils sont nullptr
	 */
	this->cle 	= x;
	this->fg 	= nullptr;
	this->fd 	= nullptr;
	this->pere 	= nullptr;
}

Noeud::~Noeud() {
	/*
	 * Destructeur d'un Noeud
	 */	
	if(this->fg != nullptr) {
		
		delete(this->fg);
	}
	if(this->fd != nullptr) {
		
		delete(this->fd);
	}
}

ABR::ABR() {
	/*
	 * Constructeur d'un ABR vide
	 */
	this->r = nullptr;
}

ABR::ABR(char* filename) {
	/*
	 * Constructeur d'un ABR via une liste de noeuds
	 */
    this->r = nullptr;
	ifstream file(filename);
	int n 	= 0;
	int tmp = 0;
	int cpt = 0;

	file >> n;
	for(int i = 0 ; i < n ; i++) {
		
		file >> tmp;
		if(this->insertion(tmp)) {
			
			cpt++;
		}
	}

	cout << "Nombre d'elements inseres = " << cpt << endl;	
	file >> this->e;
	cout << "Recherche infixe :";
	this->infixe(this->r);
	cout << endl;
	file.close();
}

ABR::~ABR() {
	/*
	 * Destructeur d'un ABR
	 */
	if(this->r != nullptr) {
		
		delete(this->r);
	}
}

Noeud* ABR::root() {
	/*
	 * Accesseur à la racine r
	 */
	return this->r;
}

int ABR::getE() {
	/*
	 * Accès à e (un élément qui sera recherché)
	 */
	return this->e;
}

void ABR::infixe(Noeud* node) {
	/*
	 * Parcours infixe
	 */
	if (node != nullptr) {
		this->infixe(node->fg);
		node->affiche();
		this->infixe(node->fd);
	}
}

void Noeud::affiche() {
	/*
	 * Affiche la cle du noeud 
	 */
	cout << " " << this->cle;
}



//recherche
Noeud* ABR::recherche(int cle) {
    /*
     * Recherche de la valeur cle depuis la racine r.
     * La méthode retourne l'adresse de "cle" s'il existe
     * ou nullptr sinon.
	 */
    if (this->r != nullptr) {
		
		return this->r->recherche(cle);
	}
	return nullptr;
}

Noeud * Noeud::recherche(int cle) {
	/*
     * Recherche de la valeur cle.
     * La méthode retourne l'adresse de "cle" s'il existe
     * ou nullptr sinon.
	 */
	if (cle < this->cle) {
		
		if (this->fg != nullptr) {
			
			return this->fg->recherche(cle);
		}
		return nullptr;
	}
	else if (cle > this->cle) {
		
		if (this->fd != nullptr) {
			
			return this->fd->recherche(cle);
		}
		return nullptr;
	}
	return this;
}



//insertion
bool ABR::insertion(int cle) {
    /*
     * Insertion de "cle" dans l'arbre depuis la racine r
     * "cle" étant un identifiant unique, il faudra vérifier qu'il 
     * n'existe pas déjà dans l'arbre, auquel cas il ne faudra pas l'insérer.
     * 
     * La méthode doit renvoyer "vrai" si l'insertion a pu être faite
     * et "faux" sinon.
     */ 
	if (this->r != nullptr) {
		
		return this->r->insertion(cle);
	}
	Noeud* root = new Noeud(cle);
	this->r = root;
	return true;
}

bool Noeud::insertion(int cle) {
	/*
     * Insertion de "cle" dans l'arbre
     * "cle" étant un identifiant unique, il faudra vérifier qu'il 
     * n'existe pas déjà dans l'arbre, auquel cas il ne faudra pas l'insérer.
     * 
     * La méthode doit renvoyer "vrai" si l'insertion a pu être faite
     * et "faux" sinon.
     */
	if (cle < this->cle) {
		
		if (this->fg != nullptr) {
			
			return this->fg->insertion(cle);
		}
		else {
			
			Noeud * newNode = new Noeud(cle);
			newNode->pere = this;
			this->fg = newNode;
			return true;
		}
	}
	else if (cle > this->cle) {
		
		if (this->fd != nullptr) {
			
			return this->fd->insertion(cle);
		}
		else {
			
			Noeud * newNode = new Noeud(cle);
			newNode->pere = this;
			this->fd = newNode;
			return true;
		}
	}
    return false;
}



//minimum
Noeud* ABR::minimum(Noeud* root) {
	/* 
	 * Recherche de l'adresse du Noeud
	 * de plus petite cle dans l'arbre de racine root 
	 */
	if (this->r != nullptr) {
		
		this->r->minimum(root);
	}
	return nullptr;
}

Noeud* Noeud::minimum(Noeud* root) {
	/* 
	 * Recherche de l'adresse du Noeud
	 * de plus petite cle dans l'arbre de racine root 
	 */
	if (this->fg != nullptr) {
		
		return this->fg->minimum(root);
	}
	return this;
}



//Maximum
Noeud* ABR::maximum(Noeud* root) {
	/*
	 * Recherche de l'adresse du Noeud 
	 * de plus grande cle dans l'arbre de racine root
	 */
    if (this->r != nullptr) {
		
		this->r->maximum(root);
	}
	return nullptr;
}

Noeud* Noeud::maximum(Noeud* root) {
	/*
	 * Recherche de l'adresse du Noeud 
	 * de plus grande cle dans l'arbre de racine root
	 */
	if (this->fd != nullptr) {
		
		return this->fd->maximum(root);
	}
	return this;
}



//Predecesseur
Noeud* ABR::predecesseur(Noeud* node) {
	/*
	 * Recherche de l'adresse du Noeud
	 * predecesseur de node dans l'arbre de racine r
	 * (l'attribut "r" de l'objet appelant).
	 */
    if (node->fg != nullptr) {
		
		return node->fg->maximum(node);
	}
	else {
		
		Noeud* currentNode = node->pere;
		while(currentNode != nullptr && currentNode->cle > node->cle) {

			currentNode = currentNode->pere;
		}
		return currentNode;
	}
}



//Successeur
Noeud* ABR::successeur(Noeud* node) {
	/*
	 * Recherche de l'adresse du Noeud
	 * predecesseur de node dans l'arbre de racine r
	 * (l'attribut "r" de l'objet appelant).
	 */
	if (node->fd != nullptr) {
		
		return node->fd->minimum(node);
	}
	else {
		
		Noeud* currentNode = node->pere;
		while(currentNode != nullptr && currentNode->cle < node->cle) {

			currentNode = currentNode->pere;
		}
		return currentNode;
	}
}
