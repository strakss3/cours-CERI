#include "tab.h"

Tab::Tab(int nbr) {

    words = new char*[nbr];
    size = nbr;
}

Tab::~Tab() {

    if (words != nullptr) {

        delete words;
        words = nullptr;
    }
}

void Tab::addWordWithBuffer(string * buffer) {

    int index = 0;

    for(int i = 0 ; i < size ; i++) {
        
        words[i] = &(*buffer)[index];

        while((*buffer)[index]) {
            
            index++;
        }

        index++;
    }
}

void Tab::display() {

    for(int i = 0 ; i < size ; i++) {

        cout << words[i] << endl;
    }
}

bool Tab::greaterThan(int index1, int index2) {

    // return words[index1] > words[index1]

    for(int i = 0 ; words[index1][i] || words[index2][i] ; i++) {

        if (words[index1][i] < words[index2][i] ) {

            return false;
        }
        else if (words[index1][i] > words[index2][i]) {

            return true;
        }
    }

    return false;
}

void Tab::sort() {

    char * temp = nullptr;
    for(int i = 0 ; i < size; i++) {

        for (int j = 0 ; j < size - i - 1; j++) {

            if (this->greaterThan(j, j+1)) {

                temp = words[j];
                words[j] = words[j+1];
                words[j+1] = temp;
            }
        }
    }
}

bool Tab::search() {

    return false;
}
