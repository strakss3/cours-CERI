#include <vector>
#include "apc.h"
#include "tab.h"

int main() {

    /* Arbre Lexicographique : */
    
    Arbre tree("dic-moyen.txt");
    vector<string> vect;
    tree.wordWithPrefix(&vect, "a");

    for(string str : vect) {

        cout << str << endl;
    }



    /* Tableau dynamique :

    string buff;
    string word;
    int nbr_words = 0;
    ifstream F("test.txt", ios::in);
    
    while(getline(F,word)) {

        buff += word + '\0';
        nbr_words ++;
    }

    F.close();

    Tab table(nbr_words);
    table.addWordWithBuffer(&buff);
    table.sort();
    table.display();

    */
    
    cout << endl << "------| Fin du main |------" << endl;
    return 0;
}
