#include "apc.h"
#include "tab.h"

int main() {

    /* Arbre Lexicographique : */
    
    //Arbre tree("dic-moyen.txt");
    Arbre tree("test.txt");
    tree.wordWithPrefix("j");





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
