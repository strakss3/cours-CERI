#include "interaction.h"

int main() {
    
    char answer = '\0';
    cout << "Do you want to write or correct ? (w / c) : ";
    cin >> answer;

    while (answer != 'w' && answer != 'c') {

        cout << "Error : wrong input !" << endl << endl;
        cout << "Do you want to write or correct ? (w / c) : ";
        cin >> answer;
    }

    string file_name = "text.txt";
    // cout << "Entrez le nom du fichier : ";
    // cin >> file_name;
    
    if (answer == 'w') {
        
        writeTextInTerminal(file_name, "dic-moyen.txt");
    }
    else if (answer == 'c') {

        correctText(file_name, "dic-moyen.txt");
    }
    
    cout << endl << "------| Fin du main |------" << endl;
    return 0;
}