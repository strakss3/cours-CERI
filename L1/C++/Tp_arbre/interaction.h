#include "arbre.h"

void editText(string file_name, string dic_name);
vector<string> displayWords(Arbre * tree, string last_word, int * start, int k, int max_dist);
string getLastWord(vector<char> text);
void correctText(string file_name, string dic_name);