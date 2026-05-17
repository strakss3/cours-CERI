# ------| GUIDE |------


# ------| README 1 |------
## Séance 1 (vendredi 27 mars) :
```c++
Added method :
- Noeud::Noeud()
- Noeud::Noeud(char letter)
- Noeud::~Noeud()
- Noeud::operator==(char letter)
- Noeud::operator!=(char letter)
- Noeud::operator<(char letter)
- Noeud::operator>(char letter)
- Noeud::display()
- Noeud::addInFils(char letter)
- Arbre::Arbre()
- Arbre::~Arbre()
- Arbre::addWord(string word)

Started method :
- Noeud::displayAll()
- Arbre::display()
```

## Entre les 2 séances :
```c++
Added method :
- Noeud::displayAll()
- Arbre::display()
- Tab::Tab(int nbr)
- Tab::~Tab()
- Tab::display()

Started method :
- Tab::addWordWithBuffer(string * buffer)
```

## Séance 2 (jeudi 2 avril) :
```c++
Added method :
- Tab::addWordWithBuffer(string * buffer)
- Tab::greaterThan(int index1, int index2)
- Tab::sort()
- Tab::search()
- Arbre::Arbre(string file_name)

Started method :
- Noeud::operator=(Noeud & node)
```

## Entre les 2 séances :
```c++
Added method :
- Noeud::operator=(Noeud & node)
- Noeud::displayDirectFils()
- Noeud::nbrDirectFils()
- Noeud::nbrOfWord()
- Noeud::maxLenght()
- Noeud::writeIn(ofstream &flow, string word)
- Arbre::Arbre(Arbre &tree)
- Arbre::searchWord(string word)
- Arbre::nbrOfWord()
- Arbre::maxLenght()
- Arbre::writeIn(string file_name)

Started method :
- Arbre::removeWord(string word)
- Noeud::removeWord(string word)
```

## Séance 3 (vendredi 10 avril) :
```c++
Continued method :
- Arbre::removeWord(string word)
- Arbre::removeWord(string word)
```


# ------| README 2 |------
## Séance 4 (vendredi 17 avril) :
```c++
Added method :
- Noeud::removeWord(string word)
- Arbre::removeWord(string word)

Started method :
- Noeud::wordWithPrefix(string prefix)
- Arbre::wordWithPrefix(string prefix)
```

## Entre les 2 séances :
```c++
Added method :
- Noeud::wordWithPrefix(string prefix)
- Noeud::insertFilsInVector(vector<string> * vect, string word)
- Arbre::wordWithPrefix(vector<string> * vect, string prefix)
- Arbre::addWordWithText(vector<char> text)
- levenshteinAlgorithm(string str1, string str2)
- writeTextInFile(string file_name, vector<char> text)
- writeTextInTerminal(string file_name, string dic_name)
- displayWords(Arbre * tree, vector<char> text)
```

## Séance 5 (jeudi 30 avril) :
```c++
- makefile modified
- reflexion about exercice 14
```


# ------| README 3 |------
## Entre les 2 séances :
```c++
- makefile modified
- fix display issues
- reflexion about exercice 14
```

## Séance 6 (mardi 5 avril) :
```c++
Started method :
- Noeud::listSimilarWord(vector<int> * vect, string word, vector<int> array)
- Arbre::listSimilarWord(vector<string> * vect, string word, int max_dist)

reflexion about exercie 14
```

## Entre les 2 séances :
```c++
Added method :
- Noeud::listSimilarWord(vector<int> * vect, string word, vector<int> array)
- Arbre::listSimilarWord(vector<string> * vect, string word, int max_dist)
- void writeTextInFile(string file_name, vector<string> text)
- getLastWord(vector<char> text)

Started method :
- correctText(string file_name, string dic_name)

Fix of old issues
listSimilarWord method optimised
```


# ------| README 4 |------
## Entre les 2 séances :
```c++
Added method :
- blabla

Started method :
- blabla

Comments added in all the code
README modified
```