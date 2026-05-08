#include <stdio.h>
#include <stdbool.h>
#include "function.h"

/* Exo 2.3
int main()
{
	bool prime ;
	int arrayOfPrime[100] ;
	int currentIndex = 0 ;
	
	for (int i = 1 ; i <= 100 ; i++)
	{
		if (isPrime(i))
		{
			arrayOfPrime[currentIndex] = i ;
			currentIndex += 1 ;
		}
	}
	
	displayArray(arrayOfPrime, currentIndex) ;
	
	return 0 ;
}
*/

/* Exo 3.1
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int min ;
	int max ;
	
	getMinMax(arrayOfVal, 8, &min, &max) ;
	displayArray(arrayOfVal, 8) ;
	printf("La valeur min de l'array est : %d\n", min) ;	
	printf("La valeur max de l'array est : %d\n", max) ;	
	
	return 0 ;
}
*/

/* Exo 3.2
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	double mean ;
	
	mean = getMean(arrayOfVal, 8) ;
	displayArray(arrayOfVal, 8) ;
	printf("La valeur moyenne de l'array est : %f\n", mean) ;
		
	return 0 ;
}
*/

/* Exo 3.3
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int isInside ;
	int valResearched ;
	
	printf("Entrer une valeur : ") ;
	scanf("%d", &valResearched) ;
	
	isInside = contain(arrayOfVal, 8, valResearched) ;
	displayArray(arrayOfVal, 8) ;
	
	if (isInside)
	{
		printf("La valeur %d est dans l'array.\n", valResearched) ;
	}
	else
	{
		printf("La valeur %d n'est pas dans l'array.\n", valResearched) ;
	}
		
	return 0 ;
}
*/

/* Exo 3.4 
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int indexVal ;
	int valResearched ;
	
	printf("Entrer une valeur : ") ;
	scanf("%d", &valResearched) ;
	
	indexVal = search(arrayOfVal, 8, valResearched) ;
	displayArray(arrayOfVal, 8) ;
	
	if (indexVal >= 0)
	{
		printf("%d se trouve à l'indice %d.\n", valResearched, indexVal) ;
	}
	else
	{
		printf("La valeur %d n'est pas dans l'array.\n", valResearched) ;
	}
		
	return 0 ;
}
*/

/* Exo 3.5
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int occurences ;
	int valResearched ;
	
	printf("Entrer une valeur : ") ;
	scanf("%d", &valResearched) ;
	
	occurences = count(arrayOfVal, 8, valResearched) ;
	displayArray(arrayOfVal, 8) ;
	printf("%d est présent %d fois.\n", valResearched, occurences) ;
		
	return 0 ;
}
*/

/* Exo 4.1
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int value ;
	
	printf("Tableau avant modif : ") ;
	displayArray(arrayOfVal, 8) ;
	printf("Entrer une valeur : ") ;
	scanf("%d", &value) ;
	
	resetValue(arrayOfVal, 8, value) ;
	
	printf("Tableau après modif : ") ;
	displayArray(arrayOfVal, 8) ;
	
	return 0 ;
}
*/

/* Exo 4.2
int main()
{
	int arrayOfVal[8] = {8, 12, 67, 12, 3, 5, 73, 46} ;
	int sizeOfArray = 8 ;
	int value ;
	
	printf("Tableau avant modif : ") ;
	displayArray(arrayOfVal, sizeOfArray) ;
	printf("Entrer une valeur : ") ;
	scanf("%d", &value) ;
	
	removeValue(arrayOfVal, &sizeOfArray, value) ;
	
	printf("Tableau après modif : ") ;
	displayArray(arrayOfVal, sizeOfArray) ;
		
	return 0 ;
}
*/

/* Exo 4.3 */
int main()
{
	int usersID [12] = { 5, 7, 5, 9, 1, 3, 4, 7, 4, 4, 4, 8 } ;
	int sizeOfArray = 12 ;
	
	printf("Array avant modification : ") ;
	displayArray(usersID, sizeOfArray) ;
	
	removeDoublons(usersID, &sizeOfArray) ;
	
	printf("Array sans les doublons : ") ;
	displayArray(usersID, sizeOfArray) ;
	
	return 0 ;
}
