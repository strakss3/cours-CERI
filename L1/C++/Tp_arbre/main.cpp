#include "table.h"
#include "interaction.h"

int main() {

    /* Arbre Lexicographique : */

    string file_name = "text.txt";
    cout << "Entrez le nom du fichier : ";
    // cin >> file_name;

    writeTextInTerminal(file_name, "dic-moyen.txt");

    




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