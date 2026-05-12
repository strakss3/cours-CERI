//////////////////////////////////////////////
//                                          //
// This work is licensed under CC BY-SA 4.0 //
//                                          //
// Réalisé par Philippe Gilles              //
// Largement inspiré de la machine de PIso  //
//                                          //
//////////////////////////////////////////////

#include <iostream>
#include "asm-PIso-util.h"

using namespace std;

int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		cerr << argv[0] << " est un assembleur de programme pour le processeur PIso" << endl;
		cerr << "Plus d'information ici : https://framagit.org/PGilles/asm-piso" << endl << endl;;
		cerr << "Usage : " << argv[0] << " <fichier.piso>" << endl;
		cerr << " fichier : fichier programme en assembleur PIso" << endl;
		cerr << "Le programme assembleur produit se trouvera dans <fichier.exe> " << endl;
		return 1;
	}
	
	AsmPIso A(argv[1]);
	
}
