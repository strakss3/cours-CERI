
#include <iostream>
#include "utilities.h"

using namespace std;

int main() {
	int n = 6;
	int list[n] = {1,3, 8, 7, 6, 92};
	
	int k = 17;
	bool tab_bool[n];
	for(int i = 0 ; i < n ; i++) tab_bool[i] = false;
	cout << somme(list, tab_bool, n, k) << endl << endl;
	for(int i = 0 ; i < n ; i++) cout << tab_bool[i] << " ";
	cout << endl;
}