#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct
{
	char * name ;
	int type ;
	int effect ;
	int cost ;
	
} Capacity ;

typedef struct
{
	char * name ;
	double healthPoint ;
	int actionPoint ;
	int type ;
	Capacity capacity[3] ;
	
} Glace ;

typedef struct
{
	Glace value[20] ;
	int size ;
	
} ArrayGlace ;

typedef struct
{
	char * name ;
	ArrayGlace glacePlayer ;
	
} Player ;

ArrayGlace createGlacedex() ;
Capacity createCapacity() ;
Glace createGlace(char * name) ;
Player createPlayer(char * name) ;
void suppElementArray(ArrayGlace * array, int index) ;
void displayArray(ArrayGlace * array) ;
void chooseGlace(Player array[], ArrayGlace * dex) ;
bool inRange(int value, int start, int end) ;
void displayArrayList(ArrayGlace * array) ;
void appendGlaceInArray(Glace glace, ArrayGlace * array) ;
void playerAction(Player arrayPlayer[], int * currentPlayer) ;
void nextPlayer(int * currentPlayer) ;
