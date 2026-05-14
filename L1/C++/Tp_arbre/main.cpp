#include "interaction.h"

int main() {

    // Arbre Lexicographique :

    // string file_name = "text.txt";
    // cout << "Entrez le nom du fichier : ";
    // cin >> file_name;
    // writeTextInTerminal(file_name, "dic-moyen.txt");

    Arbre tree("dic-moyen.txt");
    vector<string> vect;
    tree.listSimilarWord(&vect, "caca", 2);
    for(auto word : vect) {

        // cout << word << endl;
    }


    cout << endl << "------| Fin du main |------" << endl;
    return 0;
}