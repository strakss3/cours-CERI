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
    int ch;             //caractère écrit 
    int k = 10;         //nombre de mots affichés
    int max_dist = 3;   //dist max pour levenshtein
    int start = 0;      //index actuel dans la liste affichée
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

        //press echap
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
            displayWords(&tree, text, &start, k, max_dist);
        }
        else if (ch == KEY_BACKSPACE || ch == 127  || ch == 8) {

            if (cursor > 0) {

                text.erase(text.end() - 1);
                cursor--;

                if (text.size() == 0) {

                    clrtobot();
                    continue;
                }
                if (text[text.size()-1] != ' ') {
    
                    start = 0;
                    displayWords(&tree, text, &start, k, max_dist);
                }
                else {

                    clrtobot();
                }
            }
        }
        else if (ch >= 32 && ch <= 126) {

            text.insert(text.end(), (char)ch);
            cursor++;
            if (ch == ' ') {
                
                clrtobot();
            }
            else {
                
                start = 0;
                displayWords(&tree, text, &start, k, max_dist);
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

void displayWords(Arbre * tree, vector<char> text, int * start, int k, int max_dist) {

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

        tree->listSimilarWord(&list_of_word, last_word, max_dist);
    }

    index = 0;
    for(int i = *start ; i < (int)list_of_word.size() && i < k+*start; i++) {
    
        string str = to_string(i+1) + " - " + list_of_word[i];
        mvprintw(y+index+2, 0, "%s", str.c_str());
        index++;
    }
    move(y,x);

    if (*start > (int)list_of_word.size()) {

        *start = -k;
    }
}

void correctText(string file_name, string dic_name) {

    
    Arbre tree(dic_name);
    char ch;
    vector<string> list_of_word = {""};
    ifstream F(file_name, ios::in);
    while(F.read(&ch, 1)) {

        if (ch == ' ') {

            list_of_word.push_back("");
        }
        else {
            
            list_of_word[list_of_word.size()-1] += ch;
        }
    }
    F.close();

    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    int k = 10;
    int max_dist = 3;
    int start = 0;
    int cursor;
    
    while(true) {

        move(0,0);
        clrtoeol();
        for(auto str : list_of_word) {

            for(auto ch : str) {

                addch(ch);
            }
            addch(' ');
        }
        move(1, cursor);
        refresh();
        ch = getch();

        if(ch == 27) {

            break;
        }
    }
    endwin();
}