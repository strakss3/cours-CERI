//////////////////////////////////////////////
//                                          //
// This work is licensed under CC BY-SA 4.0 //
//                                          //
// Réalisé par Philippe Gilles              //
// Largement inspiré de la machine de PIso  //
//                                          //
//////////////////////////////////////////////

#ifndef __ASM_PISO_UTIL_H__
#define __ASM_PISO_UTIL_H__

#include <iostream>
#include <fstream>
#include <map>
#include <set>
#include <vector>

using namespace std;

class AsmPIso
{
	const int CapaciteMemoire = 65536;

	string NomFichierSource;
	string NomFichierExe;
	
	fstream FichierSource;
	fstream FichierExe;
	
	string Ligne;
	int NumeroDeLigne;
	int NB_Erreurs;
	
	// Stockage des variables
	// Une variable est stockee dans 2 maps
	// la 1re map fait le lien entre le nom et l'adresse
	map<string, int> DictionnaireVariableAdresse;
	// la 2e map fait le lien entre l'adresse et la valeur de la variable
	map<int, int> DictionnaireAdresseValeur;

	// Stockage des etiquettes
	// Une etiquette est stockee dans 1 map
	// qui fait le lien entre le nom et l'adresse
	map<string, int> DictionnaireEtiquette;

	// Stockage des operateurs arithmetiques
	// Un operateur arithmetique est stocke dans 1 map
	// qui fait le lien entre le nom et le code
	map<string, int> DictionnaireOperateurArithmetique;

	// Stockage des operateurs logiques
	// Un operateur logique est stocke dans 1 map
	// qui fait le lien entre le nom et le code
	map<string, int> DictionnaireOperateurLogique;

	// Stockage des mots clefs
	set<string> DictionnaireMotClef;

	// Stockage des erreurs
	map<int, string> DictionnaireErreurPIso;
	
	// Stockage des adresses a mettre a jour a l'edition de lien
	multimap<string, int> LienMemoire;
	
	// Stockage du programme en memoire en cours d'assemblage
	vector<int> MemoireProgramme;
	int CompteurProgramme;
	int MaxMemoire;
	
	bool ModeVerbose;
	
public:
	
	AsmPIso(string NomSource);
	~AsmPIso();

	void assemble();
	
	void ouvreFichierSource();
	void ouvreFichierExe();
	string nomme_Exe(string NomFichierSource);

	void stockeVariable();

	bool estOpa(string);
	bool estEti(string);
	bool estVar(string);
	bool estVal(string);

	void assembleInstruction();
	void editeLien();
	
	void erreur_PIso(int err);
	void init_Erreur_PIso();

	void initDictionnaireMotClefPIso();
	void initDictionnaireOperateurArithmetique();
	void initDictionnaireOperateurLogique();

};

#endif
