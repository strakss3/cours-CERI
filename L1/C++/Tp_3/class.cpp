#include "class.h"

Carte::Carte() {
	
	value = -1;
	color = -1;
	next = nullptr;
	
	//cout << "Creation Carte sans arguments" << endl;
}

Carte::Carte(int v, int c) {
	
	color = c;
	value = v;
	next = nullptr;
	
	//cout << "Creation Carte avec arguments" << endl;
}

Carte::Carte(Carte &carte) {

	color = carte.color;
	value = carte.value;
	next = nullptr;

	//cout << "Creation Carte par copie" << endl;
}

Carte::~Carte() {

	next = nullptr;
	
	//cout << "Suppression Carte" << endl;
}

Jeu::Jeu() {
	tete = nullptr;
	queue = nullptr;
	
	//cout << "Creation Jeu sans arguments" << endl;
}

Jeu::Jeu(int nbr) {
	
	int min = 14;
	
	if (nbr == 32) {
		
		min = 7;
	}
	else if (nbr == 52) {
		
		min = 2;
	}
	tete = new Carte;
	Carte *current = tete;
	
	for (int i = 0 ; i < 4 ; i++) {
		
		for (int j = min ; j < 15 ; j++) {
			
			current->next = new Carte(j, i);
			current = current->next;
		}
	}
	queue = current;
	current = tete;
	tete = current->next;
	delete current;
	
	//cout << "Creation Jeu avec arguments" << endl;
}

Jeu::Jeu(Jeu &jeu) {

	if (jeu.tete == nullptr) {
		
		tete = nullptr;
		queue = nullptr;
		return;
	}

	Carte * current = jeu.tete;
	Carte * new_current = new Carte(*current);
	tete = new_current;

	while (current->next != nullptr) {
		
		current = current->next;
		new_current->next = new Carte(*current);
		new_current = new_current->next;
	}

	queue = new_current;

	//cout << "Creation Jeu par copie" << endl;
}

Jeu::~Jeu() {

	if (tete == nullptr) {

		return;
	}

	Carte * current = tete;
	Carte * supp = current;

	while (current->next != nullptr) {

		current = current->next;
		delete supp;
		supp = current;
	}

	delete supp;	
	tete = nullptr;
	queue = nullptr;

	//cout << "Suppression Jeu" << endl;
}

void Carte::display() {
		
	string str_value = "";
	string str_color = "";
	
	switch (color) {
		case 0 :
			str_color = "trefle";
			break;
		
		case 1 :
			str_color = "carreau";
			break;
			
		case 2 :
			str_color = "coeur";
			break;
			
		case 3 :
			str_color = "pique";
			break;
		
		default :
			str_color = "probleme";
	}
	
	switch (value) {
		case 2 :
			str_value = "2";
			break;
			
		case 3 :
			str_value = "3";
			break;

		case 4 :
			str_value = "4";
			break;
			
		case 5 :
			str_value = "5";
			break;

		case 6 :
			str_value = "6";
			break;
			
		case 7 :
			str_value = "7";
			break;

		case 8 :
			str_value = "8";
			break;
			
		case 9 :
			str_value = "9";
			break;

		case 10 :
			str_value = "10";
			break;
			
		case 11 :
			str_value = "Valet";
			break;

		case 12 :
			str_value = "Dame";
			break;
			
		case 13 :
			str_value = "Roi";
			break;

		case 14 :
			str_value = "As";
			break;
			
		default :
			str_value = "probleme";
			break;		
	}

	cout << "(" << str_value << " de " << str_color << ")" << endl;
}

void Jeu::display() {
	
	if (tete == nullptr) {

		cout << "\nIl n'y a pas de cartes dans le jeu.\n" << endl;
		return;
	}

	cout << "Affichage du jeu :\n" << endl;
	Carte * current = tete;
	int i = 0;
	
	while (current != nullptr) {
		
		cout << "carte " << i+1 << " : ";
		current->display();
		current = current->next;
		i++;
	}
	
	cout << "\nTete : "; 
	tete->display();
	cout << "Queue : "; 
	queue->display();
	
	cout << "\nIl y a " << i << " cartes dans le jeu.\n" << endl;
}

Jeu Jeu::operator=(Jeu &jeu) {
	
	if (this == &jeu) {
		return *this;
	}

	if (jeu.tete == nullptr) {

		tete = nullptr;
		queue = nullptr;

		return *this;
	}

	if (this->tete != nullptr) {

		Carte * current = tete;
		Carte * supp = current;

		while (current->next != nullptr) {

			current = current->next;
			delete supp;
			supp = current;
		}
		
		delete supp;
	}

	Carte * current = jeu.tete;
	Carte * new_current = new Carte(*current);
	tete = new_current;

	while (current->next != nullptr) {

		current = current->next;
		new_current->next = new Carte(*current);
		new_current = new_current->next;
	}

	queue = new_current;

	return *this;
}

bool Carte::operator==(Carte &jeu) {

	return this->value == jeu.value;
}

bool Carte::operator<(Carte &jeu) {

	return this->value < jeu.value;
}

bool Carte::operator<=(Carte &jeu) {

	return this->value <= jeu.value;
}

bool Carte::operator>(Carte &jeu) {

	return this->value > jeu.value;
}

bool Carte::operator>=(Carte &jeu) {

	return this->value >= jeu.value;
}

Carte Jeu::piocher() {

	if (tete == nullptr) {

		return Carte();
	}

	Carte * carte = tete;
	tete = tete->next;
	Carte temp = *carte;
	delete carte;

	if (tete == nullptr) {

		queue = nullptr;
	}
	
	return temp;
}

void Jeu::ajouterEnQueue(Carte carte) {

	Carte * new_carte = new Carte(carte);

	if (tete == nullptr) {

		tete = new_carte;
		queue = new_carte;
		
	}
	else {

		queue->next = new_carte;
		queue = new_carte;
	}
}

void Jeu::ajouterEnTete(Carte carte) {

	Carte * new_carte = new Carte(carte);

	new_carte->next = tete;
	tete = new_carte;

	if (queue == nullptr) {

		queue = tete;
	}
}

bool Jeu::isShuffled(int nb2, int nb3) {

	if (tete == nullptr) {

		return false;
	}
	
	Carte * current1 = tete;
	Carte * current2 = current1;

	int test2 = 0; 
	int test3 = 0; 

	while (current1->next != nullptr) {

		current1 = current1->next;

		if (*current1 > *current2) {

			test2++;
			
			if (current1->next == nullptr) {
				
				break;
			}
			else if (*(current1->next) > *current1) {
				
				test3++;
			}
		}
	}

	return (test2 < nb2) && (test2 < nb2);
}

void Jeu::shuffle() {

	Jeu J2;

	/*Sans précision des valeurs de nb2 et nb3 pour 
	la méthode isShuffled, j'ai utilisé une boucle 
	for avec une valeur arbitraire d'itérations.*/
	
	for (int i = 0 ; i < 11 ; i++) {
	
		while (this->tete != nullptr) {
	
			J2.ajouterEnQueue(this->piocher());
			J2.ajouterEnTete(this->piocher());
		}
		this->tete = J2.tete;
		this->queue= J2.queue;
		J2.tete = nullptr;
		J2.queue = nullptr;
	}

	//cout << "Fin du shuffle." << endl;
	return;
}

Carte* Jeu::getTete() {

	return tete;
}

Carte* Jeu::getQueue() {

	return queue;
}

Jeu* createGame(int nbr_player, int nbr_cards) {

	Jeu *array = new Jeu[nbr_player];
	Jeu deck = (nbr_cards);
	deck.shuffle();

	while (deck.getTete() != nullptr) {

		for (int i = 0 ; i < nbr_player ; i++) {
			
			if (deck.getTete() == nullptr) {

				break;
			}
			array[i].ajouterEnTete(deck.piocher());
		}
	}
	//cout << "Fin Creation de la game." << endl;

	return array;
}

int Carte::getColor() {

	return color;
}

void Jeu::sort() {

	Carte *current = nullptr;
	Carte *max = nullptr;
	Carte *previous = nullptr;
	Jeu deck_sorted; 

	while (tete != nullptr) {
		
		current = tete;
		max = current;
		previous = nullptr;

		while (current->next != nullptr) {
			
			if (*(current->next) > *max) {
				
				max = current->next;
				previous = current;
			}
			current = current->next;
		}
		deck_sorted.ajouterEnTete(*max);

		if (max == tete) {
			
			tete = tete->next;
		}
		else if (max == queue) {
			
			queue = previous;
			queue->next = nullptr;
		}
		else {
			
			previous->next = max->next;
		}

		delete max;
		delete previous;
	}

	tete = deck_sorted.tete;
	queue = deck_sorted.queue;
	deck_sorted.tete = nullptr;
    deck_sorted.queue = nullptr;
}

int Jeu::getSize() {

	int size = 0;
	Carte * current = tete;

	while (current != nullptr) {
		
		size++;
		current = current->next;
	}

	return size;
}

