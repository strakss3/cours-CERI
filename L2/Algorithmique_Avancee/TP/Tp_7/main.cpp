#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include <list>
#include <string>
#include <iterator> 
#include <map>

using namespace std;

#include "hashtable.h"

/************************************************/
/* Programme principal				*/
/* argc : nombre d'arguments à l'appel du 	*/
/* programme exécutable				*/
/* argv : Liste des arguments			*/
/************************************************/
int main(int argc,char** argv)
{	
	if(argc < 3)
		cout << "Nombre d'arguments insuffisants" << endl;
	else{

		hashtable table(argv[1],argv[2]);
		table.histogramme();
		table.stat();
	}

	return(1);
}
