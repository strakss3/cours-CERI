#include "function.h"

void displayArrayDouble(double array[], int sizeArray)
{
	printf("{%f", array[0]) ;
	for (int i = 1 ; i < sizeArray ; i++)
	{
		printf(" %f", array[i]) ;
	}
	printf("}\n") ;
}

void displayArrayInt(int array[], int sizeArray)
{
	printf("{%d", array[0]) ;
	for (int i = 1 ; i < sizeArray ; i++)
	{
		printf(" %d", array[i]) ;
	}
	printf("}\n") ;
}

double *createArrayDouble(int sizeArray)
{
	double *array = malloc(sizeof(double)) ;	
	return array ;
}

int* getPositiveValues(int *array, int sizeArray)
{
	int newSize = 0 ;
	for (int i = 0 ; i < sizeArray ; i++)
	{
		if (array[i] > 0)
		{
			newSize ++ ;
		}
	}
	int *newArray = malloc(newSize * sizeof(int)) ;
	int index = 0 ;
	for (int i = 0 ; i < newSize ; i++)
	{
		if (array[i] > 0)
		{
			newArray[index] = array[i] ;
			index ++ ;	
		}
	}
	return newArray ;
}

void leakMemory()
{
	while (true)
	{
		double *reef = malloc(100 * sizeof(double)) ;
		free(reef) ;
	}
}

void reallocateMemory(int ** pointeur, int value)
{
	if (*pointeur != NULL)
	{
		free(*pointeur) ;
		free(pointeur) ;
	}
	pointeur = malloc(sizeof(int)) ;
	*pointeur = malloc(sizeof(int)) ;
	**pointeur = value ;
	
	printf("%d  %p\n", **pointeur, pointeur) ;
}

Census createCensus(int size)
{
	Census census = {.maxSizeArray = size, .currentSizeArray = 0} ;
	census.array = malloc(size * sizeof(int)) ;
	return census ;
}

void addToCensus(Census * census, int value)
{
	if ((*census).currentSizeArray < (*census).maxSizeArray)
	{
		(*census).array[(*census).currentSizeArray] = value ;
		(*census).currentSizeArray ++ ;
	}
	else
	{
		int *arrayTemp = malloc(((*census).maxSizeArray + 10) * sizeof(int)) ;
		for (int i = 0 ; i < (*census).maxSizeArray ; i++)
		{
			arrayTemp[i] = (*census).array[i] ;
		}
		free((*census).array) ;
		(*census).array = arrayTemp ;
		(*census).maxSizeArray += 10 ;
		addToCensus(census, value) ;
	}
}

void displayMatrixDouble(Matrix *mat)
{
    for (int i = 0 ; i < (*mat).width ; i++)
    {
        displayArrayDouble((*mat).values[i], (*mat).height) ;
    }
}

Matrix createMatrix(int width, int height)
{
    Matrix mat = {.width = width, .height = height} ;
    mat.values = malloc(width * sizeof(double*)) ;
    for (int i = 0 ; i < width ; i += 1)
    {
        mat.values[i] = malloc(height * sizeof(double)) ;
    }
    return mat ;
}

void fillRandom(Matrix *mat)
{
	srand(time(NULL)) ;
    for (int i = 0 ; i < (*mat).width ; i++)
    {
        for (int j = 0 ; j < (*mat).height ; j++)
        {
            (*mat).values[i][j] = rand() ;
        }
    }
}



