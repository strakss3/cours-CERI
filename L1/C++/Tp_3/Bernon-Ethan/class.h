#include <iostream>
#include <cmath>
#include <cstdlib>
#include <string>
using namespace std;

class Carte {
	
	friend class Jeu;
	int value;
	int color;
	Carte * next;
	
	public :
		Carte();
		Carte(int v, int c);
		Carte(Carte &carte);
		~Carte();
		void display();
		int getValue();
		int getColor();
		bool operator==(Carte &jeu);
		bool operator<(Carte &jeu);
		bool operator<=(Carte &jeu);
		bool operator>(Carte &jeu);
		bool operator>=(Carte &jeu);
	};

class Jeu {
	
	Carte * tete;
	Carte * queue;
	
	public :
		Jeu();
		Jeu(int nbr);
		Jeu(Jeu &new_jeu);
		~Jeu();
		void display();
		Jeu operator=(Jeu &jeu);
		Carte piocher();
		void ajouterEnQueue(Carte carte);
		void ajouterEnTete(Carte carte);
		bool isShuffled(int nb2, int nb3);
		void shuffle();
		Carte* getTete();
		Carte* getQueue();
		int getSize();
		void sort();
};

Jeu* createGame(int nbr_player, int nbr_cards);