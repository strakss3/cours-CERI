
#include <iostream>
#include "utilities.h"

using namespace std;

int main() {
	int n = 2;
	int list[n] = {1,3};
	
	int k = 3;
	bool tab_bool[n];
	for(int i = 0 ; i < n ; i++) tab_bool[i] = false;
	cout << somme(list, tab_bool, n, k) << endl << endl;
	for(int i = 0 ; i < n ; i++) cout << tab_bool[i] << " ";
	cout << endl;
}
