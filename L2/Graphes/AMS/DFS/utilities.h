
#ifndef _UTIL_H_
#define _UTIL_H_

#include <iostream>
const int N = 10;
void affichage(int A[][N], int n);
int parcoursprofondeur1(int A[][N], int x, int n, int marche[]);
int parcoursprofondeur2(int A[][N], int x, int n, int marche[]);
#endif
