#ifndef MATH_HPP_INCLUDED
#define MATH_HPP_INCLUDED

double addGrade() ;
double mean(int nbGrades) ;

int max2(int val1, int val2) ;
int max3(int val1, int val2, int val3) ;

double addMargin(double price) ;
double addVAT(double price) ;
double addEcoTax(double price) ;
double getPriceWithTaxes(double price) ;

bool isPrime(int number) ;

int findPrevousPrime(int number) ;
int findTwoPreviousPrimes(int number) ;

bool drawLine(int L, int l, int current_L, int current_l) ;
void drawSymbol(int line) ;
void drawRectangle(int L, int l) ;

#endif // MATH_HPP_INCLUDED
