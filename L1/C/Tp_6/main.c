#include "function.h"


/* Exo 1
int main()
{
	int * pA ;
	pA = malloc(sizeof(int)) ;
	*pA = 42 ;
	
	printf("La valeur de l'adresse mémoire %p est : \n%d \n", pA, *pA) ;
	
	free(pA) ;	
	
	return 0 ;
}
*/

/* Exo 2
int main()
{
	int sizeArray ;
	printf("Quel est la taille de votre tableau : ") ;
	scanf("%d", &sizeArray) ;
	double *array = createArrayDouble(sizeArray) ;
	
	for (int i = 0 ; i < sizeArray ; i++)
	{
		array[i] = rand() % 101 ;
	}
	
	displayArrayDouble(array, sizeArray) ;
	free(array) ;
		
	return 0 ;
}
*/

/* Exo 3
int main()
{
	int sizeArray = 5 ;
	int array[5] = {-9, 8, 5, -1, 3} ;
	
	displayArrayInt(array, 5) ;
	int *efnuisefb = getPositiveValues(array, 5) ;
	displayArrayInt(efnuisefb, sizeof(efnuisefb)/sizeof(int)) ;
	
	return 0 ;
}
*/

/* Exo 4
int main()
{
	leakMemory() ;
	return 0 ;
}
*/

/* Exo 5
int main()
{
	int *norman = NULL ;
	reallocateMemory(&norman, 5) ;
	reallocateMemory(&norman, 7) ;
	reallocateMemory(&norman, 6) ;
	reallocateMemory(&norman, 0) ;
	reallocateMemory(&norman, 1) ;
	
	free(norman) ;
	
	return 0 ;
}
*/

/* Exo 6
int main()
{
	Census test = createCensus(5) ;
	
	addToCensus(&test, 1) ;
	addToCensus(&test, 2) ;
	addToCensus(&test, 3) ;
	addToCensus(&test, 4) ;
	addToCensus(&test, 5) ;
	addToCensus(&test, 6) ;
	addToCensus(&test, 7) ;
	addToCensus(&test, 8) ;
	addToCensus(&test, 9) ;
	
	displayArrayInt(test.array, test.currentSizeArray) ;
	printf("%d et %d\n", test.currentSizeArray, test.maxSizeArray) ;
	
	return 0 ;
}
*/

/* Exo 7
int main()
{
    Matrix mat = createMatrix(3, 3) ;
    
    fillRandom(&mat) ;
    displayMatrixDouble(&mat) ;
		
    return 0 ;
}
*/

/* Exo 8
 
L'exo 6 reprend toutes les consignes de cet exo donc voir les fonctions :
- createCensus()
- addToCensus()
- displayArrayInt()

*/
