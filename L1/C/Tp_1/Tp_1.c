#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* Exo 1.1
int main()
{
	int a ;
	int b ;
	int c ;
	
	printf("%d %d %d\n", a, b, c) ;
	// Ici, les variables sont créées mais sans valeurs donc elles 
	// gardent les valeurs qu'elles avaient avant l'initialistaion
}
*/

/* Exo 1.2
int main()
{
	int a = 10 ;
	int b = 5 ;
	int c ;
	c = a + b ;
	printf("a = %d\nb = %d\nc = %d\n", a, b, c) ;
}
*/

/* Exo 1.3
int main()
{
	double x = 7.5 ;
	double y = 3.2 ;
	
	printf("x + y = %f \n", x+y) ;
	printf("x - y = %f \n", x-y) ;
	printf("x * y = %f \n", x*y) ;
	printf("x / y = %f \n", x/y) ;
}
*/

/* Exo 1.4
int main()
{
	double x ;
	double y = 1 ;
	
	printf("Valeur de x : ") ;
	scanf("%lf", &x) ;
	printf("Valeur de y : ") ;
	scanf("%lf", &y) ;
	
	printf("x + y = %f \n", x+y) ;
	printf("x - y = %f \n", x-y) ;
	printf("x * y = %f \n", x*y) ;
	printf("x / y = %f \n", x/y) ;
}
*/

/* Exo 2.1
int main()
{
	int saisie ;
	
	printf("Entrer un entier : ") ;
	scanf("%d", &saisie) ;
	
	if (saisie < 10)
	{
		printf("%d est plus petit que 10 \n", saisie) ;
	}
	else
	{
		printf("%d est plus grand ou égal à 10 \n", saisie) ;
	}
}

*/

/* Exo 2.2
int main()
{
	int saisie ;
	
	printf("Entrer un entier : ") ;
	scanf("%d", &saisie) ;
	
	if (saisie % 2 == 0)
	{
		printf("%d est est pair \n", saisie) ;
	}
	else
	{
		printf("%d est impair \n", saisie) ;
	}
}
*/

/* Exo 2.3
int main()
{
	int saisie1 ;
	int saisie2 ;
	
	printf("Entrer un entier : ") ;
	scanf("%d", &saisie1) ;
	printf("Entrer un entier : ") ;
	scanf("%d", &saisie2) ;
	
	if (saisie1 < saisie2)
	{
		printf("%d est plus petit que %d \n", saisie1, saisie2) ;
	}
	else if (saisie1 > saisie2)
	{
		printf("%d est grand que %d \n", saisie1, saisie2) ;
	}
	else 
	{
		printf("%d et %d sont égaux \n", saisie1, saisie2) ;
	}
}
*/

/* Exo 2.4
int main()
{
	double saisie1 ;
	double saisie2 ;
	int operation ;
	
	printf("Entrer un entier : ") ;
	scanf("%lf", &saisie1) ;
	printf("Entrer un entier : ") ;
	scanf("%lf", &saisie2) ;
	printf("Quelle oppération voulez vous (1 : +,2 : -,3 : *,4 : /) : ") ;
	scanf("%d", &operation) ;
	
	if (operation == 1)
	{
		printf("Résultat : %f \n", saisie1 + saisie2) ;
	}
	else if (operation == 2)
	{
		printf("Résultat : %f \n", saisie1 - saisie2) ;
	}
	else if (operation == 3)
	{
		printf("Résultat : %f \n", saisie1 * saisie2) ;
	}
	else if (operation == 4)
	{
		if (saisie2 == 0)
		{
			printf("Division par 0 impossible \n") ;
		}
		else
		{
			printf("Résultat : %f \n", saisie1 / saisie2) ;
		}
	}
}
*/

/* Exo 3.1
int main()
{
	for (int i = 1 ; i <= 10 ; i++)
	{
		printf("%d ", i) ;
	}
	printf("\n") ;
}
*/

/* Exo 3.2
int main()
{
	int saisie ;
	int somme = 0 ;
	
	printf("Saisissez un entier : ") ;
	scanf("%d", &saisie) ;
	
	for (int i = 1 ; i <= saisie ; i++)
	{
		somme += i ;
		if (i < saisie)
		{
			printf("%d + ", i) ;
		}
		else
		{
			printf("%d ", i) ;
		}
	}
	printf("= %d \n", somme) ; 
}
*/

/* Exo 3.3
int main()
{
	int saisie ;
	
	printf("Saisissez un entier : ") ;
	scanf("%d", &saisie) ;
	
	for (int i = 1 ; i <= 10 ; i++)
	{
		printf("%d * %d = %d \n",saisie, i , i*saisie) ;
	}
}
*/

/* Exo 3.4
int main()
{
	double saisie1 ;
	double saisie2 ;
	int operation = 1 ;
		
	while (operation != 0)
	{
		printf("Entrer un entier : ") ;
		scanf("%lf", &saisie1) ;
		printf("Entrer un entier : ") ;
		scanf("%lf", &saisie2) ;
		printf("Quelle oppération voulez vous (quitter : 0, 1 : +,2 : -,3 : *,4 : /) : ") ;
		scanf("%d", &operation) ;
		
		if (operation == 1)
		{
			printf("Résultat : %f \n", saisie1 + saisie2) ;
		}
		else if (operation == 2)
		{
			printf("Résultat : %f \n", saisie1 - saisie2) ;
		}
		else if (operation == 3)
		{
			printf("Résultat : %f \n", saisie1 * saisie2) ;
		}
		else if (operation == 4)
		{
			if (saisie2 == 0)
			{
				printf("Division par 0 impossible \n") ;
			}
			else
			{
				printf("Résultat : %f \n", saisie1 / saisie2) ;
			}
		}
		printf("\n") ;
	}
	printf("Au revoir !\n") ;
}
*/

/* Exo 4
int main()
{
	srand(time(0)) ;
	int proposition = 0 ;
	int mysteryNumber = rand()% 100 + 1 ;
	int numberTry = 0 ;
	
	while (proposition != mysteryNumber)
	{
		numberTry ++ ;
		printf("Essaie n°%d : ", numberTry) ;
		scanf("%d", &proposition) ;
		
		if (proposition < mysteryNumber)
		{
			printf("La solution est plus grande que %d\n", proposition) ;
		}
		else if (proposition > mysteryNumber)
		{
			printf("La solution est plus petite que %d\n", proposition) ;
		}
		else
		{
			printf("Vous avez trouvé %d en %d essais !\n", proposition, numberTry) ;
		}
	}
}
*/

// ------------------ Section 2 ------------------

/* Exo 1
int main()
{
	int number ;
	printf("Entrez un nombre : ") ;
	scanf("%d", &number) ;
	
	for (int i = 1 ; i <= number ; i++)
	{
		for (int j = 1 ; j <= i ; j++)
		{
			printf("*") ;
		}
		printf("\n") ;
	}
}
*/

/* Exo 2
int main()
{
	int number ;
	printf("Entrez un nombre : ") ;
	scanf("%d", &number) ;
	
	for (int i = 1 ; i <= number ; i++)
	{
		for (int j = 1 ; j <= number ; j++)
		{
			if ((j == 1) || (i == 1) || (i == number) || (j == number))
			{
				printf("*") ;
			}
			else
			{
				printf(" ") ;
			}
		}
		printf("\n") ;
	}
}
*/

/* Exo 3
int main()
{
	double saisie1 ;
	double saisie2 ;
	int operation = 1 ;
		
	while (operation != 0)
	{
		printf("Entrer le premier nombre : ") ;
		scanf("%lf", &saisie1) ;
		printf("Entrer le deuxième nombre : ") ;
		scanf("%lf", &saisie2) ;
		printf("Quelle oppération voulez vous (0 : exit, 1 : +,2 : -,3 : *,4 : /) : ") ;
		scanf("%d", &operation) ;
		
		if (operation == 0)
		{
			printf("Voulez-vous quitter (0) ou changer les nombres (1) : ") ;
			scanf("%d", &operation) ;
		}
		else if (operation == 1)
		{
			printf("%f + %f = %f \n",saisie1, saisie2, saisie1 + saisie2) ;
		}
		else if (operation == 2)
		{
			printf("%f - %f = %f \n",saisie1, saisie2, saisie1 - saisie2) ;
		}
		else if (operation == 3)
		{
			printf("%f * %f = %f \n",saisie1, saisie2, saisie1 + saisie2) ;
		}
		else if (operation == 4)
		{
			if (saisie2 == 0)
			{
				printf("Division par 0 impossible \n") ;
			}
			else
			{
				printf("%f / %f = %f \n",saisie1, saisie2, saisie1 / saisie2) ;
			}
		}
		printf("\n") ;
	}
	printf("Au revoir !\n") ;
}
*/
