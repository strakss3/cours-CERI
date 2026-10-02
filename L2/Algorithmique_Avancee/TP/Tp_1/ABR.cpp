/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Arbres Binaires	de Recherche					*/
/* Date dernière maj : 05/11/2019					*/
/************************************************************************/

#include <iostream>
#include <fstream>
#include "ABR.h"

using namespace std;

/****************************************/
/* Objectif : Constructeur d'un noeud dont les fils sont NULL
/* Entrées : entier x
/* Complexité : 0(1)
/****************************************/
noeud::noeud(int x)
{
	cle = x;
	fg = fd = pere =  NULL;
}


/****************************************/
/* Objectif : Destructeur d'un noeud
/****************************************/
noeud::~noeud()
{
	if(fg)
		delete(fg);
	if(fd)
		delete(fd);
}

/****************************************/
/* Objectif : Constructeur d'un ABR
/****************************************/
ABR::ABR()
{
	r = NULL;
}


/****************************************/
/* Objectif : Constructeur d'un ABR
/****************************************/
ABR::ABR(char* filename)
{
    r = NULL;   
	ifstream file(filename);
	int n,tmp,cpt = 0;

	file >> n; 
	for(int i = 0; i < n ; i++){
		file >> tmp;	
		if(insertion(tmp))
			cpt++;
	}

	cout << "Nombre d'éléments insérés = " << cpt << endl;	
	file >> e;
	infixe(r);
	cout << endl;
	file.close();
}



/****************************************/
/* Objectif : Destructeur d'un ABR
/****************************************/
ABR::~ABR()
{
	if(r)
		delete(r);
}

/****************************************/
/* Objectif : Accesseur à la racine r
/****************************************/
noeud* ABR::root()
{
	return(r);
}

/****************************************/
/* Objectif : Accès à e (un élément qui sera recherché)
/****************************************/
int ABR::gete()
{
	return(e);
}

/****************************************/
/* Objectif : Parcours infixe
/****************************************/
void ABR::infixe(noeud* x)
{
	if(x){
		infixe(x->fg);
		cout << " " << x->cle;
		infixe(x->fd);
	}
}

/****************************************/
/* Objectif : Recherche de la valeur cle.
La méthode retourne l'adresse de "cle" s'il existe
ou NULL sinon.
/****************************************/
noeud* ABR::recherche(int cle) {

    if (this->r != nullptr) {
		
		return this->r->recherche(cle);
	}
	return nullptr;
}

noeud * noeud::recherche(int cle) {

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

/****************************************/
/* Objectif : Insertion de "cle" dans l'arbre
/* "cle" étant un identifiant unique, il faudra vérifier qu'il 
n'existe pas déjà dans l'arbre, auquel cas il ne faudra pas l'insérer.

La méthode doit renvoyer "vrai" si l'insertion a pu être faite
et "faux" sinon.
/****************************************/
bool ABR::insertion(int cle) {

	if (this->r != nullptr) {
		
		return this->r->insertion(cle);
	}
	noeud* root = new noeud(cle);
	this->r = root;
	return true;
}

bool noeud::insertion(int cle) {

	if (cle < this->cle) {
		
		if (this->fg != nullptr) {
			
			return this->fg->insertion(cle);
		}
		else {
			
			noeud * newNode = new noeud(cle);
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
			
			noeud * newNode = new noeud(cle);
			newNode->pere = this;
			this->fd = newNode;
			return true;
		}
	}
    return false;
}


/****************************************/
/* Objectif : Recherche de l'adresse du noeud 
de plus petite cle dans l'arbre de racine x
/****************************************/
noeud* ABR::minimum(noeud* root) {

	if (this->r != nullptr) {
		
		this->r->minimum(root);
	}
	return nullptr;
}

noeud* noeud::minimum(noeud* root) {

	if (this->fg != nullptr) {
		
		return this->fg->minimum(root);
	}
	return this;
}

/****************************************/
/* Objectif : Recherche de l'adresse du noeud 
de plus grande cle dans l'arbre de racine x
/****************************************/
noeud* ABR::maximum(noeud* root) {

    if (this->r != nullptr) {
		
		this->r->maximum(root);
	}
	return nullptr;
}

noeud* noeud::maximum(noeud* root) {

	if (this->fd != nullptr) {
		
		return this->fd->maximum(root);
	}
	return this;
}


/****************************************/
/* Objectif : Recherche de l'adresse du noeud 
predecesseur de x dans l'arbre de racine r
(l'attribut "r" de l'objet appelant).
/****************************************/
noeud* ABR::predecesseur(noeud* node) {

    if (node->fg != nullptr) {
		
		return node->fg->maximum(node);
	}
	else {
		
		noeud* currentNode = node->pere;
		while(currentNode != nullptr && currentNode->cle > node->cle) {

			currentNode = currentNode->pere;
		}
		return currentNode;
	}
}

/****************************************/
/* Objectif : Recherche de l'adresse du noeud 
predecesseur de x dans l'arbre de racine r
(l'attribut "r" de l'objet appelant).
/****************************************/
noeud* ABR::successeur(noeud* node) {

	if (node->fd != nullptr) {
		
		return node->fd->minimum(node);
	}
	else {
		
		noeud* currentNode = node->pere;
		while(currentNode != nullptr && currentNode->cle < node->cle) {

			currentNode = currentNode->pere;
		}
		return currentNode;
	}
}
