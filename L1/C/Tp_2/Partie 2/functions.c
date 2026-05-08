#include <stdio.h>
#include <stdbool.h>
#include "functions.h"

// ------------- Exo 2.1 -------------
double addGrade()
{
	double grade ;
	
	printf("Entrez une note : ") ;
	scanf("%lf", &grade) ;
	
	return grade ;
}

double mean(int nbGrades)
{
	double sum = 0;

	for (int i = 0 ; i < nbGrades ; i++)
	{
		sum += addGrade() ;
	}
	return sum/nbGrades ;
}

// ------------- Exo 2.2 -------------

int max2(int val1, int val2)
{
	if (val1 > val2)
	{
		return val1 ;
	}
	else
	{
		return val2 ;
	}
}

int max3(int val1, int val2, int val3)
{
	return max2(max2(val1, val2), val3) ;
}

// ------------- Exo 2.3 -------------

double addMargin(double price)
{
	return 1.3 * price ;
}

double addVAT(double price)
{
	return 1.2 * price ;
}

double addEcoTax(double price)
{
	return price + 1.5 ;
}

double getPriceWithTaxes(double price)
{
	price = addMargin(price) ;
	price = addVAT(price) ;
	price = addEcoTax(price) ;
	
	return price ;
}

// ------------- Exo 2.4 -------------

bool isPrime(int number)
{
	if (number % 2 == 0 || number < 2)
	{
		return false ;
	}
	int i = 3 ;
	while (i*i < number)
	{
		if (number % i == 0)
		{
			return false ;
		}
		i += 2 ;
	}
	return true ;
}

int findPrevousPrime(int number)
{
	while (number > 0)
	{
		number -= 1 ;
		if (isPrime(number))
		{
			return number ;
		}
	}
	return -1 ;
}

int findTwoPreviousPrimes(int number)
{
	number = findPrevousPrime(number) ;
	return findPrevousPrime(number) ;
}

// ------------- Exo 2.5 -------------

bool drawLine(int L, int l, int current_L, int current_l)
{
	if (current_L == 0 || current_l == 0 || current_L == L-1 || current_l == l-1)
	{
		return true ;
	}
	else
	{
		return false ;
	}
}

void drawSymbol(int line)
{
	if (line)
	{
		printf("*") ;
	}
	else
	{
		printf("^") ;
	}
}

void drawRectangle(int L, int l)
{
	bool line ;
	for (int i = 0 ; i < L ; i++)
	{
		for (int j = 0 ; j < l ; j++)
		{
			line = drawLine(L, l, i, j) ;
			drawSymbol(line) ;
		}
		printf("\n") ;
	}
}















