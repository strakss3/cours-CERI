#include <ncurses.h>
#include <vector>
#include <string>
#include <iostream>

using namespace std;
/*
initscr();            // démarrer ncurses
raw();                // lecture brute du clavier
keypad(stdscr, TRUE); // activer touches spéciales
noecho();             // ne pas afficher automatiquement
curs_set(1);          // afficher le curseur
*/

int main() {
    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    std::vector<char> texte;
    int curseur = 0;
    int ch;
    int M = 0;

    mvprintw(0, 0, "Saisissez votre texte (TAB pour afficher les propositions:)");
    int deb = 1;
    while(true) {

        // Affichage du texte
        move(deb, 0);
        clrtoeol();
        for(char c : texte) {

	        addch(c);
        }

        // Position curseur
        move(deb, curseur);
        refresh();

        ch = getch();

        // esc = fin
        if (ch == 27) {
            
            break;
        }

        // TAB → afficher des valeur, c'est à vous de trouver et d'afficher les propositions
        else if (ch == '\t') {

            // Sauvegarder position actuelle
            int y, x;
            getyx(stdscr, y, x);

            // Afficher en dessous
            string str = to_string(M);
            const char* cstr = str.c_str();
            mvprintw(deb+3, 0, cstr);
            M++;

            str = to_string(M);
            cstr = str.c_str();
            mvprintw(deb+4, 0, cstr);
            M++;
	        str = to_string(M);
            cstr = str.c_str();
            mvprintw(deb+5, 0,cstr);
	        M++;
            string s(texte.begin(), texte.end());
            mvprintw(deb+6, 0, "%s", s.c_str());
            // Restaurer position curseur
            move(y, x);
        }
        // Flèche gauche
        else if (ch == KEY_LEFT) {

            if (curseur > 0) {
                
                curseur--;
            }
        }
        // Flèche droite
        else if (ch == KEY_RIGHT) {

            if (curseur < (int)texte.size()) {
                
                curseur++;
            }
        }
        // Backspace
        else if (ch == KEY_BACKSPACE || ch == 127 || ch == 8) {

            if (curseur > 0) {

                texte.erase(texte.begin() + curseur - 1);
                curseur--;
            }
        }
        // Caractère normal
        else if (ch >= 32 && ch <= 126) {

            texte.insert(texte.begin() + curseur, (char)ch);
            curseur++;
        }
    }
    endwin();
    string final_text(texte.begin(), texte.end());
    cout << final_text << endl;

    return 0;
}

