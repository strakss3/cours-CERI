#include "input.h"

void yap() {

    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    vector<char> text;
    int cursor = 0;
    int ch;
    mvprintw(0, 0, "Début du texte :");

    while(true) {

        move(1, 0);
        clrtoeol();
        for(char c : text) {

            addch(c);
        }

        move(1, cursor);
        refresh();
        ch = getch();

        if (ch == 27) {

            break;
        }
        else if (ch == KEY_LEFT) {

            if (cursor > 0) {

                cursor--;
            }
        }
        else if (ch == KEY_RIGHT) {

            if (cursor < (int)text.size()) {

                cursor++;
            }
        }
        else if (ch == KEY_BACKSPACE || ch == 127  || ch == 8) {

            if (cursor > 0) {

                text.erase(text.end() - 1);
                cursor--;
            }
        }
        else if (ch >= 32 && ch <= 126) {

            text.insert(text.end(), (char)ch);
            cursor++;
        }
        else if (ch == '\t') {

            int x, y;
            getyx(stdscr, y, x);
            int index = text.size()-1;

            while(index >= 0 && text[index] != ' ') {

                index--;
            }

            string word(text.begin() + index + 1, text.end());
            mvprintw(y+1, 0, "%s", word.c_str());
            move(y,x);
        }
    }
    endwin();
    string final_text(text.begin(), text.end());
    cout << final_text << endl;
}
