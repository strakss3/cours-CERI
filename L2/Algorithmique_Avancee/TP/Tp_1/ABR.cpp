#include <iostream>
#include <fstream>
#include "ABR.h"

using namespace std;


Noeud::Noeud(int x) {
	/*
	 * Constructeur d'un Noeud dont les fils sont nullptr
	*/
	this->cle = x;
	this->fg = nullptr;
	this->fd = nullptr;
	this->pere =  nullptr;
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
	 * Constructeur d'un ABR
	*/
	this->r = nullptr;
}

ABR::ABR(char* filename) {
	/*
	 * Constructeur d'un ABR
	*/
    this->r = nullptr;
	ifstream file(filename);
	int n 	= 0;
	int tmp = 0;
	int cpt = 0;

	file >> n; 
	for(int i = 0 ; i < n ; i++) {
		
		file >> tmp;	
		if(insertion(tmp)) {
			
			cpt++;
		}
	}

	cout << "Nombre d'éléments insérés = " << cpt << endl;	
	file >> this->e;
	infixe(this->r);
	cout << endl;
	file.close();
}

ABR::~ABR() {
	/*
	 * Destructeur d'un ABR
	*/
	if(this->r) {
		
		delete(this->r);
	}
}

Noeud* ABR::root() {
	/*
	 * Accesseur à la racine r
	*/
	return this->r;
}

int ABR::gete() {
	/*
	 * Accès à e (un élément qui sera recherché)
	*/
	return this->e;
}

void ABR::infixe(Noeud* x) {
	/*
	 * Parcours infixe
	*/
	if (x) {
		infixe(x->fg);
		cout << " " << x->cle;
		infixe(x->fd);
	}
}

Noeud* ABR::recherche(int cle) {
    /*
     * Recherche de la valeur cle.
     * La méthode retourne l'adresse de "cle" s'il existe
     * ou NULL sinon.
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
     * ou NULL sinon.
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

bool ABR::insertion(int cle) {
    /*
     * Insertion de "cle" dans l'arbre
     * "cle" étant un identifiant unique, il faudra vérifier qu'il 
     * n'existe pas déjà dans l'arbre, auquel cas il ne faudra pas l'insérer.
     * 
     * La méthode doit renvoyer "vrai" si l'insertion a pu être faite
     * et "faux" sinon.
    */ 
	if (this->r != nullptr) {
		return this->r->insertion(cle);
	}
	return false;
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
			
			this->fg->insertion(cle);
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
			
			this->fd->insertion(cle);
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


/****************************************/
/* Objectif : Recherche de l'adresse du Noeud 
de plus petite cle dans l'arbre de racine x
/****************************************/
Noeud* ABR::minimum(Noeud* root) {
	
	if (this->r != nullptr) {
		
		this->r->minimum(root);
	}
	return nullptr;
}

Noeud* Noeud::minimum(Noeud* root) {
	
	if (this->fg != nullptr) {
		
		return this->fg->minimum(root);
	}
	return this;
}

/****************************************/
/* Objectif : Recherche de l'adresse du Noeud 
de plus grande cle dans l'arbre de racine x
/****************************************/
Noeud* ABR::maximum(Noeud* root) {
	
    if (this->r != nullptr) {
		
		this->r->maximum(root);
	}
	return nullptr;
}

Noeud* Noeud::maximum(Noeud* root) {
	
	if (this->fd != nullptr) {
		
		return this->fd->maximum(root);
	}
	return this;
}


/****************************************/
/* Objectif : Recherche de l'adresse du Noeud 
predecesseur de x dans l'arbre de racine r
(l'attribut "r" de l'objet appelant).
/****************************************/
Noeud* ABR::predecesseur(Noeud* root) {
	
    if (this->r != nullptr) {
		
		this->r->predecesseur(root);
	}
	return nullptr;
}

Noeud* Noeud::predecesseur(Noeud* root) {
	
	if (this->fd != nullptr) {
		
		return this->fd->minimum(root);
	}
	else {
		
		Noeud* currentNode = this->fd;
		//while(currentNode != nullptr && currentNode->cle)
	}
	return nullptr;
}

/****************************************/
/* Objectif : Recherche de l'adresse du Noeud 
predecesseur de x dans l'arbre de racine r
(l'attribut "r" de l'objet appelant).
/****************************************/
Noeud* ABR::successeur(Noeud* root) {
	
    if (this->r != nullptr) {
		
		this->r->predecesseur(root);
	}
	return nullptr;
}

Noeud* Noeud::successeur(Noeud* root) {

	return nullptr;
}
