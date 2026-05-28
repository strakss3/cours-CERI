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

    string file_name;
    string dic_name = "dic-moyen.txt";
    cout << "What is the name of the file : ";
    cin >> file_name;
    
    if (answer == 'w') {
        
        editText(file_name, dic_name);
    }
    else if (answer == 'c') {

        correctText(file_name, dic_name);
    }
    
    cout << endl << "------| Fin du main |------" << endl;
    return 0;
}