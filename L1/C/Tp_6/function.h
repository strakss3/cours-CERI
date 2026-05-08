#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

typedef struct {
	
	int *array ;
	int currentSizeArray ;
	int maxSizeArray ;
	
} Census ;

typedef struct {

    int width ;
    int height ;
    double **values ;

} Matrix ;

void displayArrayDouble(double array[], int sizeArray) ;
void displayArrayInt(int array[], int sizeArray) ;
double *createArrayDouble(int sizeArray) ;
int* getPositiveValues(int *array, int sizeArray) ;
void leakMemory() ;
void reallocateMemory(int ** pointeur, int value) ;
Census createCensus(int size) ;
void addToCensus(Census * census, int value) ;
void displayArrayDouble(double array[], int sizeArray) ;
Matrix createMatrix(int width, int height) ;
void displayMatrixDouble(Matrix *mat) ;
void fillRandom(Matrix *mat) ;


