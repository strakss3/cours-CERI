#include <stdio.h>
#include <stdbool.h>

/* Exo 1.1 
void display()
{
	printf("Hello World!\n") ;
}

int main()
{
	display() ;
	return 0 ;
}
*/

/* Exo 1.2
void display(int num)
{
    printf("%d\n", num) ;
}

int main() 
{
    printf("Donner un nombre entier : ") ;
    int num ; //déclaration de la variable
    scanf("%d", &num) ; // saisie et stockage dans la variable
    display(num) ;
    return 0 ;
}
*/

/* Exo 1.3
void compareToX(int num, int pivot)
{
	if (num > pivot)
    {
        printf("Le nombre est supérieur à %d.\n", pivot) ;
    }
    else
    {
        printf("Le nombre n'est pas supérieur à %d.\n", pivot);
    }
}

int main() 
{
	int num ;
	int pivot ;
	
    printf("Donner un nombre entier : ");
    scanf("%d", &num) ;
    printf("Avec quel nombre doit il être comparé : ") ;
    scanf("%d", &pivot) ;
    
    compareToX(num, pivot) ;
    
    return 0 ;
}
*/

/* Exo 1.4
int addOne( int num )
{
    num ++ ;
    return num ;
}

int main() 
{
    int num ;
    
    printf("Donner un nombre entier: ") ;
    scanf("%d", &num) ;
    
    num = addOne(num) ;
    printf("%d\n",num) ;
    
    return 0 ;
}
*/

/* Exo 1.5
bool greaterThanX(int num, int pivot)
{
	if (num > pivot)
    {
        return true ;
    }
    else
    {
        return false ;
    }
}

int main() 
{
	int num ;
	int pivot ;
	bool result ; 
	
    printf("Donner un nombre entier : ");
    scanf("%d", &num) ;
    printf("Avec quel nombre doit il être comparé : ") ;
    scanf("%d", &pivot) ;
    
    result = greaterThanX(num, pivot) ;
    
    if (result)
    {
        printf("Le nombre est supérieur à %d.\n", pivot) ;
    }
    else
    {
        printf("Le nombre n'est pas supérieur à %d.\n", pivot);
    }
    
    return 0 ;
}
*/

/* Exo 1.6
int sumOf(int a, int b)
{
	return a + b ;
}

int main()
{
	int num1 ;
	int num2 ;
	int sum ;
	
	printf("Entrez le premier nombre : ") ;
	scanf("%d", &num1) ;
	printf("Entrez le deuxième nombre : ") ;
	scanf("%d", &num2) ;
	
	sum = sumOf(num1, num2) ;
	printf("La somme est : %d\n", sum) ;
	
	return 0 ;
}
*/

/* Exo 1.7
bool isEven(int value)
{
	if (value % 2 == 0)
	{
		return true ;
	}
	else
	{
		return false ;
	}
}

int main()
{
	int number ;
	bool parity ;
	
	printf("Entrez un nombre : ") ;
	scanf("%d", &number) ;
	
	parity = isEven(number) ;
	
	if (parity)
	{
		printf("Le nombre %d est pair.\n", number) ;
	}
	else 
	{
		printf("Le nombre %d est impair.\n", number) ;
	}
	return 0 ;
}
*/

/* Exo 1.8
int factorial(int number)
{
	int result = 1 ;
	
	while (number > 1)
	{
		result *= number ;
		number -= 1 ; 
	}
	return result ;
}

int main()
{
	int number ;
	int result ;
	
	printf("Entrez un nombre : ") ;
	scanf("%d", &number) ;
	
	result = factorial(number) ;
	printf("La factorielle de %d est %d\n", number, result) ;
	
	return 0 ;	
}
*/



