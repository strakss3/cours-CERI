#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

/* ---------------------- TD 6 ---------------------- */

/* Exo 1
bool * value = malloc(sizeof(bool)) ;

int * value = malloc(sizeof(int)) ;
 
int * ptr = malloc(sizeof(int)) ;
*ptr = 42 ;

int * ptr = malloc(sizeof(int)) ;
free(ptr) ;
int * ptr = malloc(sizeof(int)) ;

int * ptr =malloc(sizeof(int)) ;
ptr[0] = 42 ;

int * ptr = malloc( sizeof(int) );
*ptr = 16 ;
printf("%d", *ptr) ;
*ptr = 42 ;

int size = 6 ;
int * array ;
array = malloc(size * sizeof(int)) ;
*/

/* Exo 2
int * pA = malloc(sizeof(int)) ;

bool * pB = malloc(sizeof(bool)) ;
free(pB) ;

int sizeArray = 5 ;
int * array = malloc(sizeArray * sizeof(int)) ;

int sizeArray ;
scanf("%d", &sizeArray) ;
double array = malloc(sizeArray * sizeof(double)) ;

typedef struct
{
    int nbStudents ;
    double * grades ;
} MyStruct ;

MyStruct array = malloc(sizeof(MyStruct)) ;

MyStruct array = malloc(5 * sizeof(MyStruct)) ;
*/

/* Exo 3
int main() {
    int *pA = malloc(sizeof(int)) ;
    *pA = 15 ;
    int *pB = malloc(sizeof(int)) ;
    int *pC ;
    pC = pA ;  (I)
    *pA = 30 ; 
    *pB = *pA ;  (II)
    free(pA) ; 
    pA = nullptr ; 
    *pC = 40 ;  (III)
    free(pB) ;  (IV)
}
*/

/* Exo 4
int main()
{
    int choice ;
    scanf("%d", &choice) ;
    int * pA = malloc(sizeof(int)) ;
    if (choice == 0)
    {
		*pA = 8 ;
    }
    else
    {
        *pA = 16;
    }

    for (int i = 0 ; i < 10 ; i++)
    {
        int * tmp = malloc(10 * sizeof(int));
        tmp[i] = *pA * i ;
        printf("%d\n", tmp[i]);
    }
    return 0 ;
}



void createArray(int size)
{
    int * array = malloc(size * sizeof(int)) ;
    return array ;
}

int main()
{
	int size ;
    int * array = createArray(size) ;
	return 0 ;
}



int sum(int a, int b)
{
    int result = a + b ;
    return result ;
}

int main()
{
   int i = sum(sum(12 ,15), 13);
}



void copy (int *array1, int *array2, int size)
{ 
    // elle copie les valeurs d'un tableau à un autre, 
    // nous supposons qu'elle est correcte. 
}

int* add(int * array, int *currentSize, int *maxSize, int value)
{
    if ( currentSize < maxSize)
    {
        array[*currentSize] = value ;
        *currentSize ++ ;
    }
    else
    {
        int * arrayTmp = malloc(*maxSize * sizeof(int)) ;
        copy(array, arrayTmp, maxSize) ;
        
        free(array) ;
               
        array = malloc((maxSize + 20) * sizeof(int)) ;
        copy(arrayTmp, array, maxSize) ;
        *maxSize += 20 ;
        
        free(arrayTmp) ;
        
        array[*currentSize] = value ;
        *currentSize ++ ;
    }
}

int main()
{
    int * totalSize = 5 ;
    int * array = malloc(maxSize * sizeof(int)) ;
    
    array = add(array, 0, totalSize, 4) ;
    array = add(array, 1, totalSize, 5) ;
    array = add(array, 2, totalSize, 6) ;
    array = add(array, 3, totalSize, 8) ;	
    int * size = 4 ;
    
    array = add(array, size, totalSize, 12) ;
    array = add(array, size, totalSize, 15) ;
    array = add(array, size, totalSize, 2) ;
    
    free(array) ;
    return 0 ;
}
*/

/* Exo 5
int* createDynamicArray(int sizeArray)
{
	int * array = malloc(sizeArray * sizeof(int)) ;
	return array ;
}
*/

/* Exo 6
typedef struct
{
    int *data ;
    int size ;
} MyStruct ;

int main()
{
    MyStruct *obj = malloc(sizeof(MyStruct));
    free(obj.data) ;
    free(obj) ;
    
    return 0 ;
}



typedef struct
{
    int ** dataSquare;
    int size;
} MyStruct;

int main()
{
    MyStruct * obj = malloc(sizeof(MyStruct)) ;
    for (int i = 0 ; i < size ; i++)
    {
		free(obj->dataSquare[i]) ;
	}
    free(obj->dataSquare) ;
    free (obj) ;
    
    return 0 ;
}
*/

