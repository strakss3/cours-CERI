//////////////////////////////////////////////
//                                          //
// This work is licensed under CC BY-SA 4.0 //
//                                          //
// Réalisé par Philippe Gilles              //
// Largement inspiré de la machine de PIso  //
//                                          //
//////////////////////////////////////////////

#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
#include <string>
#include <map>
#include <set>
#include <vector>

#include "asm-PIso-util.h"
#include "asm-PIso-erreur.h"

using namespace std;

void AsmPIso::ouvreFichierSource()
{
	FichierSource.open(NomFichierSource, std::ifstream::in);
	if (! FichierSource.good())
	{
		erreur_PIso(ERR_PB_FIC_SOURCE);
	}
}

void AsmPIso::ouvreFichierExe()
{
	FichierExe.open(NomFichierExe, std::ifstream::out);
	if (! FichierExe.good())
	{
		erreur_PIso(ERR_PB_FIC_EXE);
	}
}

AsmPIso::AsmPIso(string NomSource)
{
	ModeVerbose = true;
	init_Erreur_PIso();
	initDictionnaireMotClefPIso();
	initDictionnaireOperateurArithmetique();
	initDictionnaireOperateurLogique();
	
	NomFichierSource = NomSource;
	ouvreFichierSource();
	
	NomFichierExe = nomme_Exe(NomFichierSource);
	ouvreFichierExe();

	cout << "Assemblage de " << NomFichierSource << " et creation de l'executable " << NomFichierExe << endl;
	FichierExe << "v2.0 raw" << endl;
	FichierExe << "# - " << endl;
	FichierExe << "# -  Fichier au format \"image file\" de Logisim" << endl;
	FichierExe << "# -  Voir http://www.cburch.com/logisim/" << endl;
	FichierExe << "# - " << endl;
	
	MemoireProgramme.assign(CapaciteMemoire,0);
	CompteurProgramme = 0;
	MaxMemoire = 0;
	assemble();
}

AsmPIso::~AsmPIso()
{
	map<string, int>::iterator it1;
	cout << "Liste des variables du programme : " << endl;
	for (it1 = DictionnaireVariableAdresse.begin() ; it1 != DictionnaireVariableAdresse.end() ; it1++)
	{
		cout << '<' << it1 -> first << ',' << hex << it1 -> second << ',' << DictionnaireAdresseValeur[it1 -> second] << '>' << dec << endl;
	}

}

void AsmPIso::assemble()
{
	NumeroDeLigne = 1;
	getline(FichierSource,Ligne);
	
	// Debut du programme assembleur
	while (! FichierSource.eof() && Ligne.substr(0,5).compare(".data") != 0 && Ligne.substr(0,5).compare(".text") != 0)
	{
		cout << NumeroDeLigne << ':' << endl;
		cout << '<' << Ligne << '>' << endl;
		NumeroDeLigne++;
		
		// On reproduit telles quelles les lignes de commentaires qui commencent par #
		if (Ligne[0] == '#')
		{
			FichierExe << Ligne << endl;
		}
    	getline(FichierSource,Ligne);
	}
	// Section .data
	if (FichierSource.eof())
	{
		erreur_PIso(ERR_EOF_FIC_SOURCE);
	}
	if (Ligne.substr(0,5).compare(".data") == 0)
	{
		cout << NumeroDeLigne << ':' << endl;
		cout << '<' << Ligne << '>' << endl;
		NumeroDeLigne++;

		FichierExe << "# - " << endl;
		FichierExe << "# - Section .data" << endl;
		FichierExe << "# - " << endl;
    	getline(FichierSource,Ligne);
		while (! FichierSource.eof() && Ligne.substr(0,5).compare(".text") != 0)
		{
			cout << NumeroDeLigne << ':' << endl;
			cout << '<' << Ligne << '>' << endl;
			NumeroDeLigne++;
			
			// On reproduit telles quelles les lignes vides
			if (Ligne.length() == 0 || Ligne.find_first_not_of(" \t\n\v\f\r") == -1)
			{
				FichierExe << endl;
			}
			// On reproduit telles quelles les lignes de commentaires qui commencent par #
			else if (Ligne[0] == '#')
			{
				FichierExe << Ligne << endl;
			}
			else
			{
				// On stocke les variables dans une map
				stockeVariable();
			}
			getline(FichierSource,Ligne);
		}
		
		cout << "Variables : " << endl;
		for (map<string, int>::iterator it = DictionnaireVariableAdresse.begin();it != DictionnaireVariableAdresse.end(); it++)
		{
			cout << hex << "< " << it->first << " : " << it->second << " : " << DictionnaireAdresseValeur[it->second] << '>' << dec << endl;
		}
		

		// Section .text
		if (FichierSource.eof())
		{
			erreur_PIso(ERR_EOF_FIC_SOURCE);
		}
		if (Ligne.substr(0,5).compare(".text") == 0)
		{
			FichierExe << "# - " << endl;
			FichierExe << "# - Section .text" << endl;
			FichierExe << "# - " << endl;

			cout << NumeroDeLigne << ':' << endl;
			cout << '<' << Ligne << '>' << endl;
			NumeroDeLigne++;

	    	getline(FichierSource,Ligne);
		}
		while (! FichierSource.eof())
		{
			cout << NumeroDeLigne << ':' << endl;
			cout << '<' << Ligne << '>' << endl;
			NumeroDeLigne++;
			
			// On reproduit telles quelles les lignes vides
			if (Ligne.length() == 0 || Ligne.find_first_not_of(" \t\n\v\f\r") == -1)
			{
				FichierExe << endl;
			}
			// On reproduit telles quelles les lignes de commentaires qui commencent par #
			if (Ligne[0] == '#')
			{
				FichierExe << Ligne << endl;
			}
			else
			{
				// On assemble les instructions
				assembleInstruction();
			}
			getline(FichierSource,Ligne);
		}
	}
	editeLien();
	
	CompteurProgramme--;
	if (MaxMemoire < CompteurProgramme)
	{
		MaxMemoire = CompteurProgramme;
	}
	
	cout << "Nombre d'octets programme : " << CompteurProgramme << endl;
	cout << "Adresse max : " << MaxMemoire << endl;
	for (int i = 0;i <= MaxMemoire; i++)
	{
		FichierExe << hex << setw(2) << MemoireProgramme[i] << ' ';
		if (i % 8 == 7)
		{
			FichierExe << endl;
		}
	}
	FichierExe << endl;
	FichierExe << dec << endl;
}

void AsmPIso::editeLien()
{
	cout << "Edition de lien" << endl;
	cout << "Nombre d'adresses a mettre a jour : " << LienMemoire.size() << endl;
	
	for (multimap<string,int>::iterator it = LienMemoire.begin();it != LienMemoire.end(); it++)
	{
		cout << it -> first << endl;
		if (estEti(it -> first))
		{
			MemoireProgramme[it -> second] = DictionnaireEtiquette[it -> first] / 256;
			MemoireProgramme[it -> second + 1] = DictionnaireEtiquette[it -> first] % 256;
		}
		else
		{
			MemoireProgramme[it -> second] = DictionnaireVariableAdresse[it -> first] / 256;
			MemoireProgramme[it -> second + 1] = DictionnaireVariableAdresse[it -> first] % 256;
		}
		cout << '<' << it -> first << '(';
		if (estEti(it -> first))
		{
			cout << DictionnaireEtiquette[it -> first] / 256 << ',' << DictionnaireEtiquette[it -> first] % 256 << ')';
		}
		else
		{
			cout << hex << DictionnaireVariableAdresse[it -> first] / 256 << ',' << DictionnaireVariableAdresse[it -> first] % 256 << ')' << dec;
		}
		cout << it -> second << '>' << endl;
	}
	cout << "Rangement des variables en memoire" << endl;
	for (multimap<string,int>::iterator it = DictionnaireVariableAdresse.begin();it != DictionnaireVariableAdresse.end(); it++)
	{
		MemoireProgramme[it -> second] = DictionnaireAdresseValeur[it -> second];
		cout << '<' << it -> first << ',' << hex << it -> second << ',' << DictionnaireAdresseValeur[it -> second] << '>' << dec << endl;
		if (MaxMemoire < it -> second)
		{
			MaxMemoire = it -> second;
		}
	}
}

void AsmPIso::stockeVariable()
{
	string Nom;
	int Adresse;
	int Valeur = 0;
	istringstream StrLigne(Ligne);
	
	StrLigne >> Nom >> hex >> Adresse >> Valeur >> dec;
	Adresse = Adresse % 65536;
	Valeur = Valeur % 256;
	cout << "#- - - <" << Nom << ',' << Adresse << ',' << Valeur << '>' << endl;
	
	if (! isalpha(Nom[0]))
	{
		cerr << "Erreur : <" << Ligne << ">" << Ligne.length() << endl;
		erreur_PIso(ERR_VAR_DEBUT_ALPHA);
	}
	if ('a' <= Nom[0] && Nom[0] <= 'f' || 'A' <= Nom[0] && Nom[0] <= 'F')
	{
		erreur_PIso(ERR_NOM_VAR_AF);
	}
	if (DictionnaireMotClef.find(Nom) != DictionnaireMotClef.end())
	{
		erreur_PIso(ERR_VAR_DIFF_MOT_CLEF);
	}
	if (DictionnaireVariableAdresse.find(Nom) != DictionnaireVariableAdresse.end())
	{
		erreur_PIso(ERR_VAR_DEJA_DEF);
	}
	DictionnaireVariableAdresse.insert(pair<string,int>(Nom, Adresse));
	DictionnaireAdresseValeur.insert(pair<int,int>(Adresse, Valeur));

	FichierExe << "# - " << Nom << "\t\t" << hex << Adresse << "\t\t" << Valeur << dec << endl;
}

bool AsmPIso::estOpa(string Eti)
{
	return Eti.back() == ':';
}

bool AsmPIso::estEti(string Eti)
{
	return Eti.back() == ':';
}

bool AsmPIso::estVal(string Ope)
{
	for (int i = 0;i < Ope.length(); i++)
		if ( ! ( ('0' <= Ope[i] && Ope[i] <= '9')     || 
		         ('A' <= Ope[i] && Ope[i] <= 'F')     ||
		         ('a' <= Ope[i] && Ope[i] <= 'f') ) )
		{
			return false;
		}
	return true;
}

bool AsmPIso::estVar(string Ope)
{
	if (! ( ('G' <= Ope[0] && Ope[0] <= 'Z')    ||
	        ('g' <= Ope[0] && Ope[0] <= 'z') ) )
	{
		return false;
	}
	for (int i = 1;i < Ope.length(); i++)
	{
		if (! ( ('0' <= Ope[i] && Ope[i] <= '9')     ||
		        ('A' <= Ope[i] && Ope[i] <= 'Z') ||
	            ('a' <= Ope[i] && Ope[i] <= 'z') ||
	            (Ope[i] == '_') ) )
		{
			return false;
		}
	}
	return true;
}

void AsmPIso::assembleInstruction()
{
	string Str1, Ope1, Ope2, Opl, Opa, Dest, Vers, Eti, Ope1Out, Ope2Out, DestOut, EtiOut, SrcOut;
	int CodeInst, CodeOpal;
	
	istringstream StrLigne(Ligne);
	
	FichierExe << "# <- " << hex << setw(4) << setfill('0') << CompteurProgramme << " " << Ligne << endl;
	FichierExe << "# -> " << hex << setw(4) << setfill('0') << CompteurProgramme << " " ;
	
	StrLigne >> Str1;
	if (Str1.back() == ':')
	{
		cout << "Etiquette" << endl;
		if (DictionnaireEtiquette.find(Str1) != DictionnaireEtiquette.end())
		{
			erreur_PIso(ERR_ET_DEJA_AFFECTEE);
		}
		DictionnaireEtiquette.insert(pair<string,int>(Str1,CompteurProgramme));
		
		FichierExe << Str1 << "\t\t";
		StrLigne >> Str1;
	}
	else
	{
		FichierExe << "\t\t\t";
	}

	if (Str1 == "Vers")		// Instruction Vers, code 5
	{
		StrLigne >> Str1;
		if (Str1.back() != ':')
		{
			erreur_PIso(ERR_ET_ATTENDUE);
		}
//		LienMemoire.insert(pair<string,int>(Str1,CapaciteMemoire));
		
		Eti = Str1;
		MemoireProgramme[CompteurProgramme++] = 0x50;
		LienMemoire.insert(pair<string,int>(Eti,CompteurProgramme));
		CompteurProgramme++;
		CompteurProgramme++;
		
		if (ModeVerbose)
		{
			FichierExe << 0x50 << " " << Eti + "h " << Eti + "b" << endl << endl;
		}
	}
	else if (Str1 == "Si")		// Instruction Si, code 6 ou 7
	{
		StrLigne >> Ope1 >> Opl >> Ope2 >> Vers >> Eti;
		if (Eti.back() != ':')
		{
			erreur_PIso(ERR_SYNTAXE_SI);
		}
		Ope1Out = Ope1 + "h " + Ope1 + "b";
		if (estVar(Ope2))
		{
			CodeInst = 7;
			Ope2Out = Ope2 + "h " + Ope2 + "b";
		}
		else
		{
			CodeInst = 6;
			Ope2Out = Ope2;
		}
		EtiOut = Eti + "h " + Eti + "b";
		
		CodeOpal = DictionnaireOperateurLogique[Opl];
		MemoireProgramme[CompteurProgramme++] = CodeInst * 16 + CodeOpal;
		LienMemoire.insert(pair<string,int>(Ope1,CompteurProgramme));
		CompteurProgramme++;
		CompteurProgramme++;
		if (estVar(Ope2))
		{
			LienMemoire.insert(pair<string,int>(Ope2,CompteurProgramme));
			CompteurProgramme++;
			CompteurProgramme++;
		}
		else
		{
			MemoireProgramme[CompteurProgramme++] = stoi(Ope2,nullptr,16);
		}
		LienMemoire.insert(pair<string,int>(Eti,CompteurProgramme));
		CompteurProgramme++;
		CompteurProgramme++;

		if (ModeVerbose)
		{
			FichierExe << hex << CodeInst << CodeOpal ;
			FichierExe << ' ' << Ope1Out ;
			FichierExe << ' ' << Ope2Out ;
			FichierExe << ' ' << EtiOut ;
			FichierExe << dec << endl << endl;
		}


		if (DictionnaireVariableAdresse.find(Ope1) == DictionnaireVariableAdresse.end())
		{
			erreur_PIso(ERR_VAR_NON_DEF);
		}
	}
	else if (DictionnaireVariableAdresse.find(Str1) != DictionnaireVariableAdresse.end())
	{
		
		Dest = Str1;
		StrLigne >> Str1;
		if (Str1 != ":=")
		{
			erreur_PIso(ERR_AFFECTATION_ATTENDUE);
		}							// Instruction Affectation Var := Const,  code 1
		StrLigne >> Ope1;
		if (estVal(Ope1))
		{
			if (ModeVerbose)
			{
				DestOut = Dest + "h " + Dest + "b";
				FichierExe << hex << 0x10  ;
				FichierExe << ' ' << Ope1 ;
				FichierExe << ' ' << DestOut ;
				FichierExe << dec << endl << endl;
			}
			MemoireProgramme[CompteurProgramme++] = 0x10;
			LienMemoire.insert(pair<string,int>(Dest,CompteurProgramme));
			CompteurProgramme++;
			CompteurProgramme++;
			MemoireProgramme[CompteurProgramme++] = stoi(Ope1,nullptr,16);

		}
		else
		{
			if (! estVar(Ope1))
			{
				erreur_PIso(ERR_VAR_ATTENDUE);
			}
			StrLigne >> Opa;
			cout << " ------> <" << Opa << '>' << endl;
			if (Opa == "")			// Instruction Affectation Var := Var,  code 2
			{
				if (ModeVerbose)
				{
					DestOut = Dest + "h " + Dest + "b";
					SrcOut = Ope1 + "h " + Ope1 + "b";
					FichierExe << hex << 0x20  ;
					FichierExe << ' ' << SrcOut ;
					FichierExe << ' ' << DestOut ;
					FichierExe << dec << endl << endl;
				}
				MemoireProgramme[CompteurProgramme++] = 0x20;
				LienMemoire.insert(pair<string,int>(Ope1,CompteurProgramme));
				CompteurProgramme++;
				CompteurProgramme++;
				LienMemoire.insert(pair<string,int>(Dest,CompteurProgramme));
				CompteurProgramme++;
				CompteurProgramme++;
			}
			else
			{
									// Instruction Affectation Var := Var Opa XXX,  code 3 ou 4
				StrLigne >> Ope2;
				
				if (estVal(Ope2))	// Instruction Affectation Var := Var Opa Const,  code 3
				{
					CodeInst = 3;
					CodeOpal = DictionnaireOperateurArithmetique[Opa];
					
					MemoireProgramme[CompteurProgramme++] = CodeInst * 16 + CodeOpal;
					LienMemoire.insert(pair<string,int>(Ope1,CompteurProgramme));
					CompteurProgramme++;
					CompteurProgramme++;
					MemoireProgramme[CompteurProgramme++] = stoi(Ope2,nullptr,16);
					LienMemoire.insert(pair<string,int>(Dest,CompteurProgramme));
					CompteurProgramme++;
					CompteurProgramme++;

					if (ModeVerbose)
					{
						DestOut = Dest + "h " + Dest + "b";
						Ope1Out = Ope1 + "h " + Ope1 + "b";
						FichierExe << CodeInst << CodeOpal ;
						FichierExe << ' ' << Ope1Out ;
						FichierExe << ' ' << Ope2 ;
						FichierExe << ' ' << DestOut ;
						FichierExe << endl << endl;
					}
				}
				else				// Instruction Affectation Var := Var Opa Var,  code 4
				{
					CodeInst = 4;
					CodeOpal = DictionnaireOperateurArithmetique[Opa];

					MemoireProgramme[CompteurProgramme++] = CodeInst * 16 + CodeOpal;
					LienMemoire.insert(pair<string,int>(Ope1,CompteurProgramme));
					CompteurProgramme++;
					CompteurProgramme++;
					LienMemoire.insert(pair<string,int>(Ope2,CompteurProgramme));
					CompteurProgramme++;
					CompteurProgramme++;
					LienMemoire.insert(pair<string,int>(Dest,CompteurProgramme));
					CompteurProgramme++;
					CompteurProgramme++;

					if (ModeVerbose)
					{
						DestOut = Dest + "h " + Dest + "b";
						Ope1Out = Ope1 + "h " + Ope1 + "b";
						Ope2Out = Ope2 + "h " + Ope2 + "b";
						FichierExe << CodeInst << CodeOpal ;
						FichierExe << ' ' << Ope1Out ;
						FichierExe << ' ' << Ope2Out ;
						FichierExe << ' ' << DestOut ;
						FichierExe << endl << endl;
					}
				}
			}
		}
	}
	else if (DictionnaireEtiquette.find(Str1) != DictionnaireEtiquette.end())
	{
		FichierExe << "Etiquette" << endl;
	}
	else
	{
		erreur_PIso(ERR_VAR_OU_ET_ATTENDUE);
	}
}

string AsmPIso::nomme_Exe(string NomFichierSource)
{
	string Exe;
	Exe = NomFichierSource.substr(NomFichierSource.find_last_of('/') + 1);
	Exe = Exe.substr(0, Exe.length() - 5) + ".exe";
	
	return Exe;
}

void AsmPIso::erreur_PIso(int err)
{
	if (err < NB_Erreurs)
	{
		cerr << Ligne << endl;
		cerr << "Erreur " << err << " : " << DictionnaireErreurPIso[err] << endl;
	}
	else
		cerr << "Erreur " << err << " : " << DictionnaireErreurPIso[1] << endl;
	
	exit(err);
}

void AsmPIso::init_Erreur_PIso()
{
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_PAS_ERREUR, "Pas d'erreur"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_INCONNUE, "Erreur inconnue"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_PB_FIC_SOURCE, "Probleme avec le fichier Source"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_PB_FIC_EXE, "Probleme avec le fichier Exe"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_EOF_FIC_SOURCE, "Fin de fichier Source inattendue"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_DEBUT_ALPHA, "Une variable doit commencer par un caractere alphabetique"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_DIFF_MOT_CLEF, "Une variable ne doit pas s'appeler comme un mot clef"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_DEJA_DEF, "Variable deja definie"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_OU_ET_ATTENDUE, "Variable ou etiquette attendue"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_NOM_VAR_AF, "Variable qui commence par a/A .. f/F"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_ET_DEJA_AFFECTEE, "Etiquette deja affectee"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERREUR_FICHIER_ERREUR, "Probleme avec le fichier d'erreur"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_ET_ATTENDUE, "Etiquette attendue"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_SYNTAXE_SI, "Erreur de syntaxe instruction Si"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_NON_DEF, "Variable non definie"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_AFFECTATION_ATTENDUE, ":= (affectation) attendue"));
	DictionnaireErreurPIso.insert(pair<int,string>(ERR_VAR_ATTENDUE, "Variable attendue"));

	NB_Erreurs = DictionnaireErreurPIso.size();
}

void AsmPIso::initDictionnaireMotClefPIso()
{
	DictionnaireMotClef.insert("Vers");
	DictionnaireMotClef.insert("Si");
}

void AsmPIso::initDictionnaireOperateurArithmetique()
{
	DictionnaireOperateurArithmetique.insert(pair<string,int>("O",0x0));
	DictionnaireOperateurArithmetique.insert(pair<string,int>("+",0x2));
	DictionnaireOperateurArithmetique.insert(pair<string,int>("-",0x3));
	DictionnaireOperateurArithmetique.insert(pair<string,int>("*",0x4));
	DictionnaireOperateurArithmetique.insert(pair<string,int>("/",0x5));
}

void AsmPIso::initDictionnaireOperateurLogique()
{
	DictionnaireOperateurLogique.insert(pair<string,int>("=",0x6));
	DictionnaireOperateurLogique.insert(pair<string,int>("<>",0x7));
	DictionnaireOperateurLogique.insert(pair<string,int>(">",0x8));
	DictionnaireOperateurLogique.insert(pair<string,int>("<",0x9));
	DictionnaireOperateurLogique.insert(pair<string,int>(">=",0xA));
	DictionnaireOperateurLogique.insert(pair<string,int>("<=",0xB));
}

