#include <stdio.h>
#include <stdbool.h>

typedef struct
{
	int numRow ;
	int numCol ;
    int value[3][3] ;

} Matrix ;

Matrix createMatrix() ;
void fillMatrix(Matrix * matrix) ;
void display(Matrix * matrix) ;
int diagSum(Matrix * matrix) ;
Matrix transposedMatrix(Matrix * matrix) ;
