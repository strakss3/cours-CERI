#include "class.h"

int main() {
	
	int nbr_player = 0;
	int nbr_manches = 0 ;
	int winning_player = -1;
	
	cout << "Combien de joueurs dans cette partie ? ";
	cin >> nbr_player;
	int current_player = nbr_player;

	Jeu *array_deck = createGame(nbr_player, 52);
	Jeu tas;
	Carte current;


	while (current_player > 1) {

		nbr_manches++;
		current_player = 0;
		winning_player = -1;
		cout << "\n------| Manche " << nbr_manches << " |------\n"<< endl;

		for (int i = 0 ; i < nbr_player ; i++) {
			
			if (array_deck[i].getTete() == nullptr) {

				continue;
			}

			current = array_deck[i].piocher();
			cout << "Carte du joueur " << i+1 << " : ";
			current.display();

			if (tas.getTete() == nullptr || current > *tas.getTete()) {
				
				tas.ajouterEnTete(current);
				winning_player = i;
			}
			else {
				
				tas.ajouterEnQueue(current);
			}
		}

		cout << "\n- Le joueur " << winning_player+1 << " gagne avec : ";
		tas.getTete()->display();
		cout << endl;

		while (tas.getTete() != nullptr) {

			array_deck[winning_player].ajouterEnQueue(tas.piocher());
		}

		for (int i = 0 ; i < nbr_player ; i++) {
			
			if (array_deck[i].getTete() == nullptr) {

				cout << "Le joueur " << i+1 << " n'a plus de cartes." << endl;
			}
			else {

				cout << "Le joueur " << i+1 << " a " << array_deck[i].getSize() << " cartes." << endl;
				current_player++;
			}
		}
	}

	cout << "\n\nLe joueur " << winning_player+1 << " gagne la partie en " << nbr_manches << " manches." << endl;
	cout << "\n------| Fin du jeu |------" << endl;
	
	return 0;
}
