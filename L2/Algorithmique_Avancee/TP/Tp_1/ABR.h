/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Arbres Binaires	de Recherche					*/
/* Date dernière maj : 05/11/2019					*/
/************************************************************************/

/****************************************/
/* Noeud contenant un entier un fils    */
/* gauche et un fils droit		*/
/****************************************/
class Noeud {
	
	public:
		int cle;
		Noeud* fg;
		Noeud* fd;
		Noeud* pere;
		
		Noeud(int x);
		~Noeud();
		void Affiche(Noeud* x);
		Noeud* recherche(int cle);
		bool insertion(int cle);
		Noeud* minimum(Noeud* root);
		Noeud* maximum(Noeud* root);
		Noeud* predecesseur(Noeud* root);
		Noeud* successeur(Noeud* root);
};

/****************************************/
/* Arbre binaire d'entiers		*/
/****************************************/
class ABR{
	
	friend class evaluate;
	
	private :
		Noeud* r;
		int e; // Element à chercher
	
	public :
		ABR();
		ABR(char* filename);
		~ABR();
		Noeud* root();
		int gete();
		void infixe(Noeud* x);
		Noeud* recherche(int cle);
		bool insertion(int cle);
		Noeud* maximum(Noeud* root);
		Noeud* minimum(Noeud* root);
		Noeud* successeur(Noeud* root);
		Noeud* predecesseur(Noeud* root);
};
