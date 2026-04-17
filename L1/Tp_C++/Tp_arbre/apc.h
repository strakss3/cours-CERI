#include <iostream>
#include <string>
#include <fstream>

using namespace std;

class Noeud {
    
    friend class Arbre;

    char info;
    Noeud * fils;
    Noeud * frere;
    
    public :
        Noeud();
        Noeud(char letter);
        ~Noeud();
        Noeud& operator=(Noeud & node);
        bool operator==(char letter);
        bool operator!=(char letter);
        bool operator<(char letter);
        bool operator>(char letter);
        void display();
        void displayDirectFils();
        void displayAll(string word = "");
		void addInFils(char letter);
        bool removeWord(string word);
        int nbrDirectFils();
        int nbrOfWord();
        int maxLength();
        void writeIn(ofstream &flow, string word = "");
        void wordWithPrefix(string prefix);
};

class Arbre {

    Noeud * racine;
    
    public:
        Arbre();
        Arbre(string file_name);
        Arbre(Arbre &tree);
        ~Arbre();
        void addWord(string word);
        void display();
        void displayFirstFils(); 
        bool searchWord(string word);
        void removeWord(string word);
        int nbrOfWord();
        int maxLength();
        void writeIn(string file_name);
        void wordWithPrefix(string prefix);
};
