#include <iostream>
#include <string>
#include <fstream>
using namespace std;

class Tab {

    char ** words;
    int size;

    public :
        Tab(int nbr);
        ~Tab();
        void addWordWithBuffer(string * buffer);
        void display();
        void sort();
        bool search();
        bool greaterThan(int index1, int index2);
};
