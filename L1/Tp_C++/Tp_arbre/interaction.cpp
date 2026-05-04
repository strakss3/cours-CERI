#include "interaction.h"

void writeTextInTerminal(string file_name, string dic_name) {

    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    Arbre tree(dic_name);
    vector<char> text;
    int cursor = 0;
    int ch;
    int k = 10;
    int start = 0;
    mvprintw(0, 0, "Debut du texte :");
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
        else if (ch == 9) {

            start = start + k;
            displayWords(&tree, text, &start, k);
        }
        else if (ch == KEY_BACKSPACE || ch == 127  || ch == 8) {

            if (cursor > 0) {

                text.erase(text.end() - 1);
                cursor--;
            }
            start = 0;
            displayWords(&tree, text, &start, k);
        }
        else if (ch >= 32 && ch <= 126) {

            text.insert(text.end(), (char)ch);
            cursor++;
            if (ch == ' ') {
                
                clrtobot();
            }
            else {
                
                start = 0;
                displayWords(&tree, text, &start, k);
            }
        }
    }
    endwin();

    tree.addWordWithText(text);
    string final_text(text.begin(), text.end());
    cout << final_text << endl;
    tree.writeIn("output.txt");
    writeTextInFile(file_name, text);
}

void displayWords(Arbre * tree, vector<char> text, int * start, int k) {

    int x, y;
    getyx(stdscr, y, x);
    int index = text.size()-1;
    move(y+2, 0);
    clrtobot();

    while(index >= 0 && text[index] != ' ') {

        index--;
    }

    string last_word(text.begin() + index + 1, text.end());
    vector<string> list_of_word;
    tree->listWithPrefix(&list_of_word, last_word);

    if ((int)list_of_word.size() == 0) {

        // ajouter la liste des mots similaires
    }

    index = 0;
    for(int i = *start ; i < (int)list_of_word.size() && i < k+*start; i++) {
    
        mvprintw(y+index+2, 0, "%s", list_of_word[i].c_str());
        index++;
    }
    move(y,x);

    if (*start > (int)list_of_word.size()) {

        *start = -k;
    }
}