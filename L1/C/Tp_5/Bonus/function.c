#include "function.h"

ArrayGlace createGlacedex()
{
	ArrayGlace dex = {.size = 20} ;
	char * allNames[20] = {"Bulbizarre", "Herbizarre", "Florizarre", 
		"Salamèche", "Reptincel", "Dracaufeu", "Carapuce", 
		"Carabaffe", "Tortank", "Chenipan", "Chrysacier", 
		"Papilusion", "Aspicot", "Coconfort", "Dardargnan", 
		"Roucool", "Roucoups", "Roucarnage", "Rattata", "Rattatac"} ;

	for (int i = 0 ; i < dex.size ; i++)
	{
		dex.value[i] = createGlace(allNames[i]) ;
	}
	return dex ;
}

Capacity createCapacity()
{
	Capacity capacity = {"test", 0, 1, 1} ;
	return capacity ;
}

Glace createGlace(char * name)
{
	Glace glace = {name, 100.00, 10, 0, createCapacity()} ;
	return glace ;
}

Player createPlayer(char * name)
{
	Player player = {.name = name} ;
	return player ;
}

void suppElementArray(ArrayGlace * array, int index)
{
	if (inRange(index, 0, (*array).size))
	{
		for (int i = index ; i < (*array).size -1; i++)
		{
			(*array).value[i] = (*array).value[i+1] ;
		}
	(*array).size += -1 ;
	}
}

void displayArray(ArrayGlace * array)
{
	for (int i = 0 ; i < (*array).size ; i++)
	{
		printf("%s ", (*array).value[i].name) ;
	}
	printf("\n") ;
}

void displayArrayList(ArrayGlace * array)
{
	for (int i = 0 ; i < (*array).size ; i++)
	{
		printf("(%d) %s \n", i, (*array).value[i].name) ;
	}
}

bool inRange(int value, int start, int end)
{
	return ((value >= start) && (value < end)) ;
}

void chooseGlace(Player array[], ArrayGlace * dex)
{
	int currentPlayer = 0 ;
	int indexGlace = -1 ;
	while (currentPlayer < 6)
	{
		while (!inRange(indexGlace, 0, (*dex).size))
		{
			printf("%s, choisisez un Glace parmis :\n", array[currentPlayer%2].name) ;
			displayArrayList(dex) ;
			printf("\n") ;
			printf("Choix n°") ;
			scanf("%d", &indexGlace) ;
			printf("\n") ;
			if (inRange(indexGlace, 0, (*dex).size))
			{
				printf("%s ajouté à l'équipe de %s.\n\n", (*dex).value[indexGlace].name, array[currentPlayer%2].name) ;
				appendGlaceInArray((*dex).value[indexGlace], &array[currentPlayer%2].glacePlayer) ;
				suppElementArray(dex, indexGlace) ;
				break ;
			}
			else
			{
				printf("Problème dans la séléction, veillez recommencer.\n") ;
			}
		}
		indexGlace = -1 ;
		currentPlayer ++ ;
	}
	printf("L'équipe de %s contient :\n", array[0].name) ;
	displayArrayList(&array[0].glacePlayer) ;
	printf("\n\n") ;
	printf("L'équipe de %s contient :\n", array[1].name) ;
	displayArrayList(&array[1].glacePlayer) ;
}

void appendGlaceInArray(Glace glace, ArrayGlace * array)
{
	(*array).value[(*array).size] = glace ;
	(*array).size ++ ;
}



void playerAction(Player arrayPlayer[], int * currentPlayer)
{
	int action = 0 ;
	while (! inRange(action, 1, 4))
	{
		printf("%s, vous avez 3 options d'action.\n", arrayPlayer[*currentPlayer].name) ;
		printf("(1) Changer de Glace actif.\n") ;
		printf("(2) Passer son tour.\n") ;
		printf("(3) Utiliser une capacité.\n\n") ;
		printf("Que voulez vous faire : ") ;
		scanf("%d", &action) ;
		printf("\n") ;
		switch (action)
		{
			case 1 :
			{
				printf("Vous voulez changer de Glace actif.\n") ;
				break ;
			}
			case 2 :
			{
				printf("Vous passez votre tour.\n") ;
				printf("%d\n", *currentPlayer) ;
				nextPlayer(currentPlayer) ;
				printf("%d\n", *currentPlayer) ;
				break ;
			}
			case 3 :
			{
				printf("Vous allez utilier une capacité.\n") ;
				break ;
			}
			default :
			{
				printf("Problème dans la séléction, veillez recommencer.\n\n") ;
				continue ;
			}
		}
		
	}
}

void nextPlayer(int * currentPlayer)
{
	*currentPlayer = (*currentPlayer + 1) % 2 ;
}

























