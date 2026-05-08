#include "arbre.h"

Noeud::Noeud() {

    info = '\0';
    fils = nullptr;
    frere = nullptr;
}

Noeud::Noeud(char letter) {

    info = letter;
    fils = nullptr;
    frere = nullptr;
}

Noeud::~Noeud() {

    if (fils != nullptr) {
        
        delete fils;
        fils = nullptr;
    }
    if (frere != nullptr) {

        delete frere;
        frere = nullptr;
    }
}

Noeud& Noeud::operator=(Noeud & node) {
    
    if (this == &node) {

        return *this;
    }

    info = node.info;

    if (node.frere != nullptr) {

        if (frere == nullptr) {

            frere = new Noeud();
        }

        *frere = *node.frere;
    }
    else {

        delete frere;
        frere = nullptr;
    }

    if (node.fils != nullptr) {

        if(fils == nullptr) {

            fils = new Noeud();
        }

        *fils = *node.fils;
    }
    else {

        delete fils;
        fils = nullptr;
    }

    return *this;
}

bool Noeud::operator==(char letter) {

    return (info == letter);
}

bool Noeud::operator!=(char letter) {

    return (info != letter);
}

bool Noeud::operator<(char letter) {

    return (info < letter);
}

bool Noeud::operator>(char letter) {

    return (info > letter);
}

void Noeud::display() {

    if (info == '\0') {

        cerr << "/";
    }
    else {

        cerr << info;
    }
}

void Noeud::displayDirectFils() {

    Noeud * current = fils;
    while (current != nullptr) {

        current->display();
        current = current->frere;
    }
    cout << endl;
}

void Noeud::displayAll(string word) {

    if (*this == '\0') {

        cout << word << endl;
    }

    if (fils != nullptr) {

        fils->displayAll(word + info);
    }
    
    if (frere != nullptr) {

        frere->displayAll(word);
    }
}

void Noeud::addInFils(char letter) {
	
	if (fils == nullptr) {
		
		fils = new Noeud(letter);
		return;
	}
	if (*fils > letter) {
		
		Noeud * node = new Noeud(letter);
		node->frere = fils;
		fils = node;
		return;
	}
	
	Noeud * current = fils;
	
	while (current != nullptr) {
		
		if (*current == letter) {

			return;
		}
		if (current->frere == nullptr) {
			
			current->frere = new Noeud(letter);
			return;
		}
		if (*current->frere > letter) {
			
			Noeud * node = new Noeud(letter);
			node->frere = current->frere;
			current->frere = node;
			return;
		}

		current = current->frere;
	}
}

int Noeud::nbrDirectFils() {

    int i = 0;
    Noeud * current = fils;
    while(current != nullptr) {

        current = current->frere;
        i++;
    }
    
    return i;
}

bool Noeud::removeWord(string word) {
   
    Noeud * current = fils;
    Noeud * precedent = this;

    if (word[0]) {

        while (current != nullptr) {
            
            if (*current == word[0]) {

                break;
            }

            precedent = current;
            current = current->frere;
        }

        if (current == nullptr) {

            return false;
        }

        word.erase(word.begin());
        if (!current->removeWord(word)) {

            return false;
        }
    }

    if (this->nbrDirectFils() == 1) {

        delete this->fils;
        this->fils = nullptr;
        return true;
    }
    else {

        if (current->frere == nullptr) {

            delete precedent->frere;
            precedent->frere = nullptr;
        }
        else {

            Noeud * temp = current->frere;
            current->info = temp->info;
            current->fils = temp->fils;
            current->frere = temp->frere;
            temp->fils = nullptr;
            temp->frere = nullptr;
            delete temp;
            temp = nullptr;
        }

        return false;
    }
}

int Noeud::nbrOfWord() {

    int count = 0;

    if (info == '\0') {

        count = 1;
    }
    if (fils != nullptr) {

        count += fils->nbrOfWord();
    }
    if (frere != nullptr) {

        count += frere->nbrOfWord();
    }

    return count;
}

int Noeud::maxLength() {

    if (*this == '\0') {

        if (frere != nullptr) {

            return frere->maxLength();
        }
        else {

            return 0;
        }
    }
    else {

        if (frere != nullptr) {

            return max(1 + fils->maxLength(), frere->maxLength());
        }
        else {

            return 1 + fils->maxLength();
        }
    }
}

void Noeud::writeIn(ofstream &flow, string word) {

    if (*this == '\0') {

        flow << word << endl;
    }

    if (fils != nullptr) {

        fils->writeIn(flow, word + this->info);
    }

    if (frere != nullptr) {

        frere->writeIn(flow, word);
    }
}

void Noeud::listWithPrefix(vector<string> * vect, string prefix) {

    Noeud * current = this;
    for (int i = 0 ; prefix[i] ; i++) {

        current = current->fils;
        
        while (*current != prefix[i]) {
            
            current = current->frere;
            if (current == nullptr) {

                return;
            }
        }
    }
    if (current != nullptr) {
        
        current->fils->insertFilsInVector(vect, prefix);
    }
}

void Noeud::insertFilsInVector(vector<string> * vect, string word) {

    if (*this == '\0') {

        vect->insert(vect->end(), word);
    }

    if (this->fils != nullptr) {

        fils->insertFilsInVector(vect, word + this->info);
    }
    
    if (this->frere != nullptr) {

        frere->insertFilsInVector(vect, word);
    }
}

void Noeud::listSimilarWord(vector<int> * vect, string word, vector<int> array) {

    if (*this == '\0') {
        
        vect->insert(vect->end(), array[array.size()-1]);
    }
    if (fils != nullptr) {

        int delt;
        vector<int> new_row = {array[0]+1};
        for(int i = 1 ; i < (int)array.size() ; i++) {

            if(word[i-1] == info) {

                delt = 0;
            }
            else {

                delt = 1;
            }
            new_row.insert(new_row.end(), min(min(new_row[i-1]+1, array[i]+1), array[i-1]+delt));
        }

        fils->listSimilarWord(vect, word, new_row);
    }
    if (frere != nullptr) {

        frere->listSimilarWord(vect, word, array);
    }
}




Arbre::Arbre() {

    racine = new Noeud();
}

Arbre::Arbre(string file_name) {

    string word;
    racine = new Noeud();
    ifstream F(file_name, ios::in);

    while(getline(F,word)) {

        this->addWord(word);
    }

    F.close();
}

Arbre::Arbre(Arbre &tree) {

    racine = new Noeud();
    *racine = *tree.racine;
}

Arbre::~Arbre() {

    delete racine;
    racine = nullptr;
}

void Arbre::addWord(string word) {
    
    Noeud * current = racine;
    
    for (int i = 0 ; word[i] ; i++) {

        current->addInFils(word[i]);
        current = current->fils;

        while (*current != word[i]) {

            current = current->frere;
        }
    }
    current->addInFils('\0');
}

void Arbre::display() {
	
    racine->fils->displayAll();
}

void Arbre::displayFirstFils() {

    racine->displayDirectFils();
}

bool Arbre::searchWord(string word) {

    Noeud * current = racine->fils;
    int i = 0;

    while (current != nullptr) {
        
        if (*current == word[i]) {
            
            i++;
            current = current->fils;
            continue;
        }
        current = current->frere;
    }
    if ((i > 0) && (word[i-1] == '\0')) {

        return true;
    }
    
    return false;
}

void Arbre::removeWord(string word) {

    if(this->searchWord(word)) {

        racine->removeWord(word);
    }
}

int Arbre::nbrOfWord() {

    return racine->fils->nbrOfWord();
}

int Arbre::maxLength() {

    return racine->fils->maxLength();
}

void Arbre::writeIn(string file_name) {

    ofstream F(file_name, ios::out);
    racine->fils->writeIn(F);
    F.close();
}

void Arbre::listWithPrefix(vector<string> * vect, string prefix) {

    if (racine->fils != nullptr) {

        racine->listWithPrefix(vect, prefix);
    }
}

void Arbre::addWordWithText(vector<char> text) {

    int index1 = 0;
    for(int index2 = 0 ; index2 < (int)text.size() ; index2++) {
        
        if (text[index2] == ' ' || index2 == (int)text.size()-1) {

            string word(text.begin() + index1, text.begin() + index2+1);
            this->addWord(word);
            index1 = index2+1;
        }
    }
    string word(text.begin() + index1, text.end());
    this->addWord(word);
}

void Arbre::listSimilarWord(vector<string> * array_str, string word, int max_dist) {

    if (racine == nullptr) {

        return;
    }

    vector<int> first_row = {0};
    for(int i = 0 ; word[i] ; i++) {
        
        first_row.insert(first_row.end(), i+1);
    }
    
    vector<int> array_int;
    racine->fils->listSimilarWord(&array_int, word, first_row);
    racine->fils->insertFilsInVector(array_str);

    for(int i = 0 ; i < (int)array_int.size() ; i++) {

        if (array_int[i] > max_dist) {

            array_int.erase(array_int.begin()+i);
            array_str->erase(array_str->begin()+i);
            i--;
        }
    }

    for(int i = 0 ; i < (int)array_int.size()-1 ; i++) {

        for(int j = 0 ; j < (int)array_int.size()-i-1 ; j++) {

            if(array_int[j] > array_int[j+1]) {

                swap(array_int[j], array_int[j+1]);
                swap((*array_str)[j], (*array_str)[j+1]);
            }
        }
    }
}



int levenshteinAlgorithm(string str1, string str2) {

    int size_str1 = 0;
    for(int i = 0 ; str1[i] ; i++) {

        size_str1++;
    }

    int size_str2 = 0;
    for(int j = 0 ; str2[j] ; j++) {

        size_str2++;
    }

    int tab[size_str1+1][size_str2+1];
    for(int i = 0 ; i <= size_str1 ; i++) {

        tab[i][0] = i;
    }

    for(int j = 0 ; j <= size_str2 ; j++) {

        tab[0][j] = j;
    }

    int delt;
    for(int i = 1 ; i <= size_str1 ; i++) {

        for(int j = 1 ; j <= size_str2 ; j++) {

            if (str1[i-1] == str2[j-1]) {

                delt = 0;
            }
            else {

                delt = 1;
            }
            tab[i][j] = min(tab[i-1][j-1]+delt, min(tab[i-1][j]+1, tab[i][j-1]+1));
        }
    }
    
    return tab[size_str1][size_str2];
}

void writeTextInFile(string file_name, vector<char> text) {

    ofstream F(file_name, ios::out);
    for(char letter : text) {

        F << letter;
    }
    F.close();
}

