
#ifndef _UTIL_H_
#define _UTIL_H_

const int N = 50;
void affichage(int A[][N], int n);
void affichage(int x, int n, int d[]);
void distances(int A[][N], int x, int n, int d[N]);
int excentricite(int A[][N], int i, int n);
int diametre(int A[][N], int n);
int rayon(int A[][N], int n);
int cycle(int A[][N], int i, int j, int n);
int circonference(int A[][N], int n);
#endif
