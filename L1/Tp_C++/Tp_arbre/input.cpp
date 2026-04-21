#include "input.h"

void yap(string file_name, string dic_name) {

    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    Arbre tree(dic_name);
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
            displayWords(&tree, text);
        }
        else if (ch >= 32 && ch <= 126) {

            text.insert(text.end(), (char)ch);
            cursor++;
            displayWords(&tree, text);

        }
    }
    endwin();

    tree.addWordWithText(text);
    string final_text(text.begin(), text.end());
    cout << final_text << endl;
    tree.writeIn("output.txt");
    writeTextInFile(file_name, text);
}

void displayWords(Arbre * tree, vector<char> text) {

    int x, y;
    getyx(stdscr, y, x);
    int index = text.size()-1;
    move(y+2, 0);
    clrtobot();

    while(index >= 0 && text[index] != ' ') {

        index--;
    }

    string prefix(text.begin() + index + 1, text.end());
    vector<string> list_prefix;
    tree->wordWithPrefix(&list_prefix, prefix);

    for(int i = 0 ; i < (int)list_prefix.size() ; i++) {

        mvprintw(y+i+2, 0, "%s", list_prefix[i].c_str());
    }
    move(y,x);
}