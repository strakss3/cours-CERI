#include <stdio.h>
#include <stdbool.h>
#include "functions.h"

/* Exo 2.1
int main()
{
	int nbGrades ;
	double result ;
	
	printf("Entrez le nombre de notes : ") ;
	scanf("%d", &nbGrades) ;
	result = mean(nbGrades) ;
	
	printf("La moyenne est : %f\n", result) ;
	
	return 0 ;
}
*/

/* Exo 2.2
int main()
{
	int val1 ;
	int val2 ;
	int val3 ;
	int greatest ;
	
	printf("Entrez le premier nombre : ") ;
	scanf("%d", &val1) ;
	printf("Entrez le deuxième nombre : ") ;
	scanf("%d", &val2) ;
	printf("Entrez le troisième nombre : ") ;
	scanf("%d", &val3) ;
	
	greatest = max3(val1, val2, val3) ;
	
	printf("Le plus grand nombre est : %d\n", greatest) ;
	
	return 0 ;
}
*/

/* Exo 2.3
int main()
{
	double price ;
	
	printf("Entrez le prix hors taxe du produit : ") ;
	scanf("%lf", &price) ;
	
	price = getPriceWithTaxes(price) ;
	printf("Le prix final TTC est : %f euros\n", price) ;
	
	return 0 ;
}
*/

/* Exo 2.4
int main()
{
	int number ;
	int prime1 ;
	int prime2 ;
	
	printf("Saisir un nombre : ") ;
	scanf("%d", &number) ;
	
	prime1 = findPrevousPrime(number) ;
	prime2 = findTwoPreviousPrimes(number) ;
	
	printf("Les deux nombres premiers avant %d sont : %d et %d\n", number, prime1, prime2) ;
	
	return 0 ;
}
*/

/* Exo 2.5
int main()
{
	int l ;
	int L ;

	printf("Entrez un nombre : ") ;
	scanf("%d", &L) ;
	printf("Entrez un nombre : ") ;
	scanf("%d", &l) ;
	
	drawRectangle(L, l) ;
	
	return 0 ;
}
*/
