class Noeud {
	/*
	 * Noeud contenant un entier un fils
	 * gauche et un fils droit
	 */
	public:
		int cle;
		Noeud* fg;
		Noeud* fd;
		Noeud* pere;
		
		Noeud(int x);
		~Noeud();
		void affiche();
		Noeud* recherche(int cle);
		bool insertion(int cle);
		Noeud* minimum(Noeud* root);
		Noeud* maximum(Noeud* root);
};


class ABR{
	/*
	 * Arbre binaire d'entiers
	 */
	friend class evaluate;
	
	private :
		Noeud* r;
		int e; // Element à chercher
	
	public :
		ABR();
		ABR(char* filename);
		~ABR();
		Noeud* root();
		int getE();
		void infixe(Noeud* node);
		Noeud* recherche(int cle);
		bool insertion(int cle);
		Noeud* maximum(Noeud* root);
		Noeud* minimum(Noeud* root);
		Noeud* successeur(Noeud* node);
		Noeud* predecesseur(Noeud* node);
};
