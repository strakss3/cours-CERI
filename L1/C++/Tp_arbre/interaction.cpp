#include "interaction.h"

void editText(string file_name, string dic_name) {

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
    while(true) {

        move(0, 0);
        clrtoeol();
        for(char c : text) {

            addch(c);
        }

        move(0, cursor);
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
            displayWords(&tree, getLastWord(text), &start, k, max_dist);
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
                    displayWords(&tree, getLastWord(text), &start, k, max_dist);
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
                displayWords(&tree, getLastWord(text), &start, k, max_dist);
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

string getLastWord(vector<char> text) {

    int index = text.size()-1;

    while(index >= 0 && text[index] != ' ') {

        index--;
    }

    string str(text.begin() + index + 1, text.end());
    return str;
}

vector<string> displayWords(Arbre * tree, string last_word, int * start, int k, int max_dist) {

    int x, y;
    getyx(stdscr, y, x);
    int index = 0;
    move(y+2, 0);
    clrtobot();

    vector<string> array_suggestion;
    vector<string> list_of_word;
    tree->listWithPrefix(&list_of_word, last_word);

    if ((int)list_of_word.size() == 0) {

        tree->listSimilarWord(&list_of_word, last_word, max_dist);
    }

    for(int i = *start ; i < (int)list_of_word.size() && i < k+*start; i++) {
    
        array_suggestion.push_back(list_of_word[i]);
        string str = to_string(i-*start+1) + " - " + list_of_word[i];
        mvprintw(y+index+2, 0, "%s", str.c_str());
        index++;
    }
    move(y,x);

    if (*start > (int)list_of_word.size()) {

        *start = -k;
    }

    return array_suggestion;
}

void correctText(string file_name, string dic_name) {

    Arbre tree(dic_name);
    char ch_char;
    int ch_int;
    vector<string> list_of_word = {""};
    ifstream F(file_name, ios::in);
    while(F.read(&ch_char, 1)) {

        if (ch_char == ' ') {

            list_of_word.push_back("");
        }
        else {
            
            list_of_word[list_of_word.size()-1] += ch_char;
        }
    }
    F.close();

    initscr();
    raw();
    keypad(stdscr, TRUE);
    noecho();
    curs_set(1);

    start_color();
    use_default_colors();
    init_pair(1, COLOR_RED, -1);

    int k = 9;                  //k must be : 0 < k < 10
    int max_dist = 3;
    int start = 0;
    int cursor = 0;
    int index_word = 0;
    int index_wrong_cursor = 0;
    int count_wrong_words = 0;
    bool move_cursor = true;
    vector<string> array_suggestion;
    
    while(true) {
        
        cursor = 0;
        count_wrong_words = 0;
        move_cursor = true;
        index_word = 0;

        move(0,0);
        clrtoeol();
        for(auto str : list_of_word) {

            if (tree.searchWord(str)) {

                if (move_cursor) {

                    index_word++;
                }

                attroff(COLOR_PAIR(1));
            }
            else {
                
                attron(COLOR_PAIR(1));
                if (index_wrong_cursor != count_wrong_words) {

                    index_word++;
                    count_wrong_words++;
                }
                else {

                    move_cursor = false;
                }
            }
            
            for(auto c : str) {
                
                addch(c);
                if (move_cursor) {
                    
                    cursor++;
                }
            }
            if (move_cursor) {
                
                cursor++;
            }
            addch(' ');
        }
        if(move_cursor) {

            break;
        }

        attroff(COLOR_PAIR(1));
        move(0, cursor);
        refresh();
        ch_int = getch();
        string current_word = list_of_word[index_word];
        
        if (ch_int == 27) {

            break;
        }
        else if (ch_int == KEY_LEFT) {

            if (index_wrong_cursor > 0) {

                index_wrong_cursor--;
            }
        }
        else if (ch_int == KEY_RIGHT) {

            index_wrong_cursor++;
        }
        else if (ch_int >= 49 && ch_int <= 57) {

            int n = ch_int - 48;
            if (n > k || array_suggestion.size() == 0) {
                
                continue;
            }
            list_of_word[index_word] = array_suggestion[n-1];

        }
        else if (ch_int == 9) {

            start = start + k;
            array_suggestion = displayWords(&tree, current_word, &start, k, max_dist);
        }
        else if (ch_int == ' ') {

            start = 0;
            array_suggestion = displayWords(&tree, current_word, &start, k, max_dist);
        }
    }
    endwin();
    
    cout << "Le texte a fini d'être corrigé :" << endl;
    for(auto str : list_of_word) {

        cout << str << " ";
        tree.addWord(str);
    }
    cout << endl;
    file_name.pop_back();
    file_name.pop_back();
    file_name.pop_back();
    writeTextInFile(file_name+"cor", list_of_word);
    tree.writeIn("output.txt");
}