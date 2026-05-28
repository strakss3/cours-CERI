#include "interaction.h"

void editText(string file_name, string dic_name) {
    /*
    Edition mode let you can write text into a ncurses terminal and save it into a file.
    The program will suggest k words similar to written word from a given dictionary.
    → : move cursor to right
    ← : move cursor to left
    Tab : cycle through suggested words
    Esc : leave editor and save file
    */

    initscr();              //start ncurses
    raw();                  //raw input values 
    keypad(stdscr, TRUE);   //unable special keys
    noecho();               //don't display automaticaly
    curs_set(1);            //display cursor

    Arbre tree(dic_name);
    vector<char> text;
    int cursor = 0;
    int ch;             //input character 
    int k = 10;         //nbr of suggested words
    int max_dist = 3;   //max levenshtein distance for suggested words
    int start = 0;      //current index of the list of suggested words
    while(true) {

        move(0, 0);
        clrtoeol();     //clear to end of line
        //display text into terminal letter by letter
        for(char c : text) {

            addch(c);
        }

        move(0, cursor);
        refresh();
        ch = getch();   //get character

        //press escape
        if (ch == 27) {

            break;
        }
        else if (ch == KEY_LEFT) {

            //prevent table overflow
            if (cursor > 0) {

                cursor--;
            }
        }
        else if (ch == KEY_RIGHT) {
            
            //prevent table overflow
            if (cursor < (int)text.size()) {

                cursor++;
            }
        }
        //press Tab
        else if (ch == 9) {

            start = start + k;
            displayWords(&tree, getLastWord(text), &start, k, max_dist);
        }
        else if (ch == KEY_BACKSPACE || ch == 127  || ch == 8) {
            
            //prevent table overflow
            if (cursor > 0) {

                text.erase(text.end() - 1);
                cursor--;

                //erase suggested words if text is empty
                if (text.size() == 0) {

                    clrtobot();     //clear to bottom
                    continue;
                }
                
                //prevent showing suggestion if last character is 'space'
                if (text[text.size()-1] != ' ') {
    
                    start = 0;
                    displayWords(&tree, getLastWord(text), &start, k, max_dist);
                }
                else {

                    clrtobot();
                }
            }
        }
        //characters, specials characters, numbers, space and other... 
        else if (ch >= 32 && ch <= 126) {

            text.insert(text.end(), (char)ch);
            cursor++;

            //prevent showing suggestion if last character is 'space'
            if (ch == ' ') {
                
                clrtobot();
            }
            else {
                
                start = 0;
                displayWords(&tree, getLastWord(text), &start, k, max_dist);
            }
        }
    }
    endwin();       //close ncurses

    //tree.addWordWithText(text);                   //add non existing words into tree
    string final_text(text.begin(), text.end());    //get all text
    cout << final_text << endl;
    tree.writeIn(dic_name);                         //update tree
    writeTextInFile(file_name, text);               //create final file
}

string getLastWord(vector<char> text) {
    /*
    Return the last word from a text stored as vector<char>
    */

    int index = text.size()-1;

    while(index >= 0 && text[index] != ' ') {

        index--;
    }

    string str(text.begin() + index + 1, text.end());
    return str;
}

vector<string> displayWords(Arbre * tree, string last_word, int * start, int k, int max_dist) {
    /*
    Suggests and displays k word from a given word.
    If the word is the beginning of an other word, it is treated as a prefix.
    If the word isn't in the tree, it use levenshtein algorithm
    */

    int x, y;
    getyx(stdscr, y, x);
    int index = 0;
    move(y+2, 0);
    clrtobot();

    vector<string> array_suggestion;    //used to store only displayed suggested words
    vector<string> list_of_word;        //used to store every suggested words
    tree->listWithPrefix(&list_of_word, last_word);     //fill list_of_word

    //if word isn't beginning of an other word
    if ((int)list_of_word.size() == 0) {

        tree->listSimilarWord(&list_of_word, last_word, max_dist);
    }

    //display and add suggestion
    for(int i = *start ; i < (int)list_of_word.size() && i < k+*start; i++) {
    
        array_suggestion.push_back(list_of_word[i]);
        string str = to_string(i-*start+1) + " - " + list_of_word[i];
        mvprintw(y+index+2, 0, "%s", str.c_str());
        index++;
    }
    move(y,x);

    //loop throught list
    if (*start > (int)list_of_word.size()) {

        *start = -k;
    }

    return array_suggestion;
}

void correctText(string file_name, string dic_name) {
    /*
    Searches for words in a text that do not exist in the given dictionary. Save the corrected text in a .cor file.
    → : jump to the next incorrect word and leave the corrector upon reaching the end
    ← : jump to the previous incorrect word
    Space : show suggested words 
    Tab : cycle through suggested words
    1-9 : choose among suggested words
    Esc : leave the editor and create the .cor file
    */

    Arbre tree(dic_name);
    char ch_char;                           //used to read file character
    int ch_int;                             //used to read user input
    vector<string> list_of_word = {""};     //array where all text is store word by word
    ifstream F(file_name, ios::in);         //open flow to read text character by character
    while(F.read(&ch_char, 1)) {

        if (ch_char == ' ') {

            list_of_word.push_back("");
        }
        else {
            
            list_of_word[list_of_word.size()-1] += ch_char;     //append character to the current word
        }
    }
    F.close();

    initscr();              //start ncurses
    raw();                  //raw input values 
    keypad(stdscr, TRUE);   //unable special keys
    noecho();               //don't display automaticaly
    curs_set(1);            //display cursor

    start_color();                  //enable colorization
    use_default_colors();
    init_pair(1, COLOR_RED, -1);    //red color for wrong words

    int k = 9;                          //must be : 0 < k < 10
    int max_dist = 3;                   //must be max_dist > 0
    int start = 0;                      //current index of the list of suggested words
    int cursor = 0;
    int index_word = 0;                 //index of current word in list_of_word
    bool move_cursor = true;            //used to stop cursor to a specific word
    int count_wrong_words = 0;          //nbr of non existing words in the text
    int index_wrong_cursor = 0;         //index of current non existing word
    vector<string> array_suggestion;    //store suggested words
    
    while(true) {
        
        cursor = 0;
        count_wrong_words = 0;
        move_cursor = true;
        index_word = 0;

        move(0,0);
        clrtoeol();
        for(auto str : list_of_word) {

            //check if current word is in tree
            if (tree.searchWord(str)) {

                if (move_cursor) {

                    index_word++;
                }

                attroff(COLOR_PAIR(1));     //white color
            }
            else {
                
                attron(COLOR_PAIR(1));      //red color
                if (index_wrong_cursor != count_wrong_words) {

                    index_word++;
                    count_wrong_words++;
                }
                else {

                    move_cursor = false;
                }
            }
            
            //display current word letter by letter
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
        //leave ncurses if every words are correct
        if(move_cursor) {

            break;
        }

        attroff(COLOR_PAIR(1));
        move(0, cursor);
        refresh();
        ch_int = getch();       //get character
        string current_word = list_of_word[index_word];
        
        //press escape
        if (ch_int == 27) {

            break;
        }
        else if (ch_int == KEY_LEFT) {

            //prevent table overflow
            if (index_wrong_cursor > 0) {

                index_wrong_cursor--;
            }
        }
        else if (ch_int == KEY_RIGHT) {

            index_wrong_cursor++;
        }
        //press number between 1 and 9
        else if (ch_int >= 49 && ch_int <= 57) {

            int n = ch_int - 48;        //convert ascii to real number

            //prevent table overflow
            if (n > k || array_suggestion.size() == 0 || n > (int)array_suggestion.size()) {
                
                continue;
            }
            list_of_word[index_word] = array_suggestion[n-1];   //correct wrong word

        }
        //press Tab
        else if (ch_int == 9) {

            start = start + k;
            array_suggestion = displayWords(&tree, current_word, &start, k, max_dist);
        }
        //press Space
        else if (ch_int == ' ') {

            start = 0;
            array_suggestion = displayWords(&tree, current_word, &start, k, max_dist);
        }
    }
    endwin();       //close ncurses
    
    cout << "Correction finished :" << endl;
    for(auto str : list_of_word) {

        cout << str << " ";
        tree.addWord(str);                  //add non existing words into tree
    }
    cout << endl;
    file_name.pop_back();                               //remove txt extension
    file_name.pop_back();                               //remove txt extension
    file_name.pop_back();                               //remove txt extension
    writeTextInFile(file_name+"cor", list_of_word);     //create final .cor file
    tree.writeIn(dic_name);                             //update tree
}