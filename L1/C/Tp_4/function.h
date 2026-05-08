#ifndef MATH_HPP_INCLUDED
#define MATH_HPP_INCLUDED

void displayArray(int array[], int sizeOfArray) ;



bool isPrime(int number) ;

void getMinMax(int array[], int sizeOfArray,int * min, int * max) ;

double getMean(int array[], int sizeOfArray) ;

bool contain(int array[], int sizeOfArray, int value) ;

int search(int array[], int sizeOfArray, int value) ;

int count(int array[], int sizeOfArray, int value) ;

int searchInRange(int array[], int sizeOfArray, int value, int start, int end) ;
int countBis(int array[], int sizeOfArray, int value) ;

void resetValue(int array[], int sizeOfArray, int value) ;

void shiftArray(int array[], int *sizeOfArray, int index) ;
void removeValue(int array[], int *sizeOfArray, int value) ;

void removeDoublons(int array[], int *sizeOfArray);

#endif // MATH_HPP_INCLUDED
