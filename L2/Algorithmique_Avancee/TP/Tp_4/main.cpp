/************************************************************************/
/* Auteur : S. Gueye							*/
/* TP : Tri par dénombrement						*/
/* Date dernière maj : 10/12/2019					*/
/************************************************************************/
#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

#include "tri.h"

main(int argc,char** argv)
{
	if(argc < 2)
		cout << "Nombre d'arguments insuffisants" << endl;
	else{
		tri obj(argv[1]);
		cout << "T (avant Tri) = ";
		obj.affiche();
		obj.triDenombrement();
		cout << "T (après Tri) = ";
		obj.affiche();
	}

	return(1);
}
