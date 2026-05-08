#include <stdio.h>
#include <stdbool.h>

typedef struct 
{
    double height ;
    double width ;
} Rectangle ;

Rectangle createRectangle(double height, double width) ;
double getWidth(Rectangle * rectangle) ;
double getHeight(Rectangle * rectangle) ;
double getArea(Rectangle * rectangle) ;
double getDiagonal(Rectangle * rectangle) ;
bool isSquare(Rectangle * rectangle) ;

