/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Arbres Binaires	de Recherche					*/
/* Date dernière maj : 05/11/2019					*/
/************************************************************************/

/****************************************/
/* noeud contenant un entier un fils    */
/* gauche et un fils droit		*/
/****************************************/
class noeud{
	public:
	int cle;
	noeud* fg;
	noeud* fd;
	noeud* pere;
	noeud(int x);
	~noeud();
	void Affiche(noeud* x);
	noeud* recherche(int cle);
	bool insertion(int cle);
	noeud* minimum(noeud* root);
	noeud* maximum(noeud* root);
};

/****************************************/
/* Arbre binaire d'entiers		*/
/****************************************/
class ABR{
	friend class evaluate;
	noeud* r;
	int e; // Element à chercher
	public :
	ABR();
	ABR(char* filename);
	~ABR();
	noeud* root();
	int gete();
	void infixe(noeud* x);
	noeud* recherche(int cle);
	bool insertion(int cle);
	noeud* maximum(noeud* x);
	noeud* minimum(noeud* x);
	noeud* successeur(noeud* x);
	noeud* predecesseur(noeud* x);
};
