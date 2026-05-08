#include "matrix.h"

Matrix createMatrix()
{
    Matrix matrix ;
    matrix.numRow = 3 ;
    matrix.numCol = 3 ;
    
    return matrix ;
}

void fillMatrix(Matrix * matrix)
{
    for (int i = 0 ; i < (*matrix).numRow ; i++)
    {
        for (int j = 0 ; j < (*matrix).numCol ; j++)
        {
            printf("ligne %d, nombre %d : ", i+1, j+1) ;
            scanf("%d", &(*matrix).value[i][j]) ;        
        }
    }
}

void display(Matrix * matrix)
{
    for (int i = 0 ; i < (*matrix).numRow ; i++)
    {
        for (int j = 0 ; j < (*matrix).numCol ; j++)
        {
            printf("%d ", (*matrix).value[i][j]) ;
        }
        printf("\n") ;
    }
}

int diagSum(Matrix * matrix)
{
    int sum = 0 ;
    for (int i = 0 ; i < 3 ; i++)
    {
		sum += (*matrix).value[i][i] ;
	}
	
    return sum ;
}

Matrix transposedMatrix(Matrix * matrix)
{
	Matrix trans = createMatrix() ;
	
	for (int i = 0 ; i < (*matrix).numRow ; i++)
	{
		for (int j = 0 ; j < (*matrix).numCol ; j++)
		{
			trans.value[2-i][2-j] = (*matrix).value[i][j] ;
		}
	}
	
	return trans ;
}












