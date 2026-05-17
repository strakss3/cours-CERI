#include "arbre.h"

Noeud::Noeud() {
    /*
    Default constructor of Noeud class
    */

    this->info = '\0';      //default value : null byte
    this->fils = nullptr;
    this->frere = nullptr;
}

Noeud::Noeud(char letter) {
    /*
    Parameterized constructor of Noeud class
    */

    this->info = letter;        //represent the node's letter
    this->fils = nullptr;
    this->frere = nullptr;
}

Noeud::~Noeud() {
    /*
    Destructor of Noeud class
    Recursively delete all frere and fils of a node
    */

    //check for fils
    if (this->fils != nullptr) {
        
        delete this->fils;
        this->fils = nullptr;
    }
    //check for frere
    if (this->frere != nullptr) {

        delete this->frere;
        this->frere = nullptr;
    }
}

Noeud& Noeud::operator=(Noeud & node) {
    /*
    overloading = operator of Noeud class
    Noeud = Noeud
    */

    //check if both operands are equals
    if (this == &node) {

        return *this;
    }

    this->info = node.info;

    //copy all frere
    if (node.frere != nullptr) {
        
        if (this->frere == nullptr) {

            this->frere = new Noeud();
        }
        
        //recursively allocate frere
        *this->frere = *node.frere;
    }
    else {

        //recursively delete existing frere
        delete this->frere;
        this->frere = nullptr;
    }
    
    //copy all fils
    if (node.fils != nullptr) {

        if(this->fils == nullptr) {

            this->fils = new Noeud();
        }

        //recusively allocate all fils
        *this->fils = *node.fils;
    }
    else {

        //recursively delete existing fils
        delete this->fils;
        this->fils = nullptr;
    }

    return *this;
}

bool Noeud::operator==(char letter) {
    /*
    overloading == operator of Noeud class
    compare node's info with a given letter
    Noeud == char
    */
    
    return (this->info == letter);
}

bool Noeud::operator!=(char letter) {
    /*
    overloading != operator of Noeud class
    compare node's info with a given letter
    Noeud != char
    */

    return (this->info != letter);
}

bool Noeud::operator<(char letter) {
    /*
    overloading < operator of Noeud class
    compare node's info with a given letter
    Noeud < char
    */

    return (this->info < letter);
}

bool Noeud::operator>(char letter) {
    /*
    overloading < operator of Noeud class
    compare node's info with a given letter
    Noeud < char
    */

    return (this->info > letter);
}

void Noeud::display() {
    /*
    Only display node's info as a character
    */

    //edge case with null byte
    if (this->info == '\0') {

        cout << "/";
    }
    else {

        cout << this->info;
    }
}

void Noeud::displayDirectFils() {
    /*
    Only display direct node's fils in one line
    */

    //create temporary pointer to run through all direct fils
    Noeud * current = this->fils;
    while (current != nullptr) {

        current->display();
        current = current->frere;
    }
    cout << endl;
}

void Noeud::displayAll(string word) {
    /*
    Pre-order traversal of node and display in terminal
    */

    //display word made with current branch
    if (*this == '\0') {

        cout << word << endl;
    }

    //recursively traverse node's fils
    if (this->fils != nullptr) {
        
        this->fils->displayAll(word + this->info);
    }
    
    //recursively traverse node's frere
    if (this->frere != nullptr) {

        this->frere->displayAll(word);
    }
}

void Noeud::addInFils(char letter) {
    /*
    add alphabetically a letter in linked list
    */

	//check if linked list is empty
	if (this->fils == nullptr) {
		
		this->fils = new Noeud(letter);
		return;
	}
    //check if letter is less than first element
	if (*this->fils > letter) {
		
		Noeud * node = new Noeud(letter);
		node->frere = this->fils;
		this->fils = node;
		return;
	}
	
    //create temporary pointer to run through all elements
	Noeud * current = this->fils;
	
	while (current != nullptr) {
		
        //check if letter already exist
		if (*current == letter) {

			return;
		}
        //check if letter need to be place at the end
		if (current->frere == nullptr) {
			
			current->frere = new Noeud(letter);
			return;
		}
        //check general case
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
    /*
    Return number of direct node's fils
    */

    int i = 0;
    Noeud * current = this->fils;
    while(current != nullptr) {

        current = current->frere;
        i++;
    }
    
    return i;
}

bool Noeud::removeWord(string word) {
    /*
    Remove one branch from binary tree with a recursive method.
    This method recursively traverse sub-tree and remove nodes during the recusive ascent
    It return if we can freely remove any upper node 
    */

    Noeud * current = this->fils;
    Noeud * precedent = this;

    //check if we are at the end of recursive call or not
    if (word[0]) {

        //move to the pointer to first letter of "word"
        while (current != nullptr) {
            
            if (*current == word[0]) {

                break;
            }

            precedent = current;
            current = current->frere;
        }

        //stop recursive call if first letter "word" isn't in direct fils so no node to remove
        if (current == nullptr) {

            return false;
        }

        word.erase(word.begin());
        //recursive call and check to end method
        if (!current->removeWord(word)) {

            return false;
        }
    }

    //if node has 1 direct fils, we can freely delete it without loosing information
    if (this->nbrDirectFils() == 1) {

        delete this->fils;
        this->fils = nullptr;
        return true;
    }
    else {

        //if at the end of chained list
        if (current->frere == nullptr) {

            delete precedent->frere;
            precedent->frere = nullptr;
        }
        //rejoining 2 parts of chained list
        else {

            //create temporary pointer to reallocate memory 
            Noeud * temp = current->frere;
            current->info = temp->info;
            current->fils = temp->fils;
            current->frere = temp->frere;
            temp->fils = nullptr;
            temp->frere = nullptr;
            delete temp;
            temp = nullptr;
        }

        //can't continue recursive deleting of node because it will remove information
        return false;
    }
}

int Noeud::nbrOfWord() {
    /*
    recursive method to count how many leave are from this sub-tree
    */

    int count = 0;
    //check if at the end of a word
    if (this->info == '\0') {

        count = 1;
    }
    //recursively traverse node'fils
    if (this->fils != nullptr) {
        
        count += this->fils->nbrOfWord();
    }
    //recursively traverse node'frere
    if (this->frere != nullptr) {

        count += this->frere->nbrOfWord();
    }

    return count;
}

int Noeud::maxLength() {
    /*
    recursively compute lenght of the longest word
    */

    //check if at the end of a word
    if (*this == '\0') {

        //check if at the end of sub-tree
        if (this->frere != nullptr) {

            //recursive call
            return this->frere->maxLength();
        }
        else {

            return 0;
        }
    }
    else {

        if (this->frere != nullptr) {

            //return max lenght of the 2 branches
            return max(1 + this->fils->maxLength(), this->frere->maxLength());
        }
        else {

            //return lenght of the only branch + 1
            return 1 + this->fils->maxLength();
        }
    }
}

void Noeud::writeIn(ofstream &flow, string word) {
    /*
    Pre-order traversal of node and write in flow given in argument
    */

    //write word made with current branch
    if (*this == '\0') {

        flow << word << endl;
    }

    //recursively traverse node's fils
    if (this->fils != nullptr) {
        
        this->fils->writeIn(flow, word + this->info);
    }
    
    //recursively traverse node's frere
    if (this->frere != nullptr) {

        this->frere->writeIn(flow, word);
    }
}

void Noeud::listWithPrefix(vector<string> * vect, string prefix) {
    /*
    Write all leaves from a branch into a flow 
    */

    Noeud * current = this;
    //run through sub-tree to prefix argument
    for (int i = 0 ; prefix[i] ; i++) {

        current = current->fils;
        while (*current != prefix[i]) {
            
            current = current->frere;
            if (current == nullptr) {

                //stop if word isn't in sub-tree
                return;
            }
        }
    }
    if (current != nullptr) {
        
        //write all sub tree starting with prefix argument
        current->fils->insertFilsInVector(vect, prefix);
    }
}

void Noeud::insertFilsInVector(vector<string> * vect, string word) {
    /*
    Pre-order traversal of node and insert in vector
    */
    
    //insert word made with current branch
    if (*this == '\0') {

        vect->push_back(word);
    }

    //recursively traverse node's fils
    if (this->fils != nullptr) {

        fils->insertFilsInVector(vect, word + this->info);
    }

    //recursively traverse node's frere
    if (this->frere != nullptr) {

        frere->insertFilsInVector(vect, word);
    }
}

void Noeud::listSimilarWord(vector<int> * vect, string word, vector<int> array) {
    /*
    Recursively compute levenshtein algorithm
    vect store levenshtein distance
    array store row of current levenshtein table
    */

    //
    if (*this == '\0') {
        
        vect->push_back(array[array.size()-1]);
    }
    if (this->fils != nullptr) {

        int delt;
        vector<int> new_row = {array[0]+1};
        for(int i = 1 ; i < (int)array.size() ; i++) {

            if(word[i-1] == this->info) {

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

    while(getline(F, word)) {

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
        
        first_row.push_back(i+1);
    }
    
    vector<int> array_int;
    racine->fils->listSimilarWord(&array_int, word, first_row);
    racine->fils->insertFilsInVector(array_str);

    vector<int> filtered_int;
    vector<string> filtered_str;

    for(int i = 0 ; i < (int)array_int.size() ; i++) {

        if (array_int[i] <= max_dist) {

            filtered_int.push_back(array_int[i]);
            filtered_str.push_back((*array_str)[i]);
        }
    }
    array_int = move(filtered_int);
    *array_str = move(filtered_str);

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
    for(auto letter : text) {

        F << letter;
    }
    F.close();
}

void writeTextInFile(string file_name, vector<string> text) {

    ofstream F(file_name, ios::out);
    for(auto letter : text) {

        F << letter << " ";
    }
    F.close();
}