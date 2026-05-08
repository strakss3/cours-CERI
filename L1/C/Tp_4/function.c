#include <stdio.h>
#include <stdbool.h>
#include "function.h"


void displayArray(int array[], int sizeOfArray)
{
	printf("{%d",array[0]) ;
	for (int i = 1 ; i < sizeOfArray ; i++)
	{
		printf(" %d", array[i]) ;
	}
	printf("}\n") ;
}



// ------------ Exo 2.3 ------------

bool isPrime(int number)
{
	if ((number % 2 == 0) && (number != 2))
	{
		return false ;
	}
	int i = 3 ;
	while (i*i <= number)
	{
		if (number % i == 0)
		{
			return false ;
		}
		i += 2 ;
	}
	return true ;
}

// ------------ Exo 3.1 ------------

void getMinMax(int array[], int sizeOfArray,int * min, int * max)
{
	*min = array[0] ;
	*max = array[0] ;
	for (int i = 1 ; i < sizeOfArray ; i++)
	{
		if (array[i] < *min)
		{
			*min = array[i] ;		
		}
		else if (array[i] > *max)
		{
			*max = array[i] ;		
		}
	}
}

// ------------ Exo 3.2 ------------

double getMean(int array[], int sizeOfArray)
{
	int sum = 0 ;
	
	for (int i = 0 ; i < sizeOfArray ; i++)
	{
		sum += array[i] ;
	}
	
	return sum / sizeOfArray ;
}

// ------------ Exo 3.3 ------------

bool contain(int array[], int sizeOfArray, int value)
{
	for (int i = 0 ; i < sizeOfArray ; i++)
	{
		if (array[i] == value)
		{
			return true ;
		}
	}
	return false ;
}

// ------------ Exo 3.4 ------------

int search(int array[], int sizeOfArray, int value)
{
	for (int i = 0 ; i < sizeOfArray ; i++)
	{
		if (array[i] == value)
		{
			return i ;
		}
	}
	return -1 ;
}

// ------------ Exo 3.5 ------------

int count(int array[], int sizeOfArray, int value)
{
	int occurences = 0 ;
	for (int i = 0 ; i < sizeOfArray ; i++)
	{
		if (array[i] == value)
		{
			occurences += 1 ;
		}
	}
	return occurences ;
}

// ---------- Exo 3.5 bis ----------

int searchInRange(int array[], int sizeOfArray, int value, int start, int end)
{
	for (int i = start ; i < end ; i++)
	{
		if (array[i] == value)
		{
			return i ;
		}
	}
	return -1 ;
}

int countBis(int array[], int sizeOfArray, int value)
{
	int occurences = 0 ;
	int indice = searchInRange(array, sizeOfArray, value, 0, sizeOfArray) ;
	
	while (indice != -1)
	{
		occurences += 1 ;
		indice = searchInRange(array, sizeOfArray, value, indice + 1, sizeOfArray) ;
	}
	return occurences ;
}

// ------------ Exo 4.1 ------------

void resetValue(int array[], int sizeOfArray, int value)
{
	for (int i = 0 ; i < sizeOfArray ; i++)
	{
		if (array[i] == value)
		{
			array[i] = 0 ;
		}
	}
}

// ------------ Exo 4.2 ------------

void shiftArray(int array[], int *sizeOfArray, int index)
{
	for (int i = index ; i < *sizeOfArray - 1 ; i++)
	{
		array[i] = array[i+1] ;
	}
	*sizeOfArray += -1 ;
}

void removeValue(int array[], int *sizeOfArray, int value)
{
	for (int i = 0 ; i < *sizeOfArray ; i++)
	{
		if (array[i] == value)
		{
			shiftArray(array, sizeOfArray, i) ;
		}
	}
}

// ------------ Exo 4.3 ------------

void removeDoublons(int array[], int *sizeOfArray)
{
	int index ;
	int i = 0 ;
	while (i < *sizeOfArray)
	{
		index = searchInRange(array, *sizeOfArray, array[i], i + 1, *sizeOfArray) ;
		if (index != -1 )
		{
			shiftArray(array, sizeOfArray, index) ;
		}
		else 
		{
			i++ ;
		}
	}
}























