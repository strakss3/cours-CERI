#include <math.h>
#include "rectangle.h"

Rectangle createRectangle(double height, double width)
{
    Rectangle rectangle = {height, width} ;
    return rectangle ;
}

double getWidth(Rectangle * rectangle)
{
    return (*rectangle).width ;
}

double getHeight(Rectangle * rectangle)
{
    return (*rectangle).height ;
}

double getArea(Rectangle * rectangle)
{
    return getWidth(rectangle) * getHeight(rectangle) ;
}

double getDiagonal(Rectangle * rectangle)
{
	double HeightSquare = getHeight(rectangle) * getHeight(rectangle) ;
	double WidthSquare = getWidth(rectangle) * getWidth(rectangle) ;
	
    return sqrt(HeightSquare + WidthSquare) ;
}

bool isSquare(Rectangle * rectangle)
{
    if (getHeight(rectangle) == getWidth(rectangle))
    {
        return true ;
    }
    else
    {
        return false ;
    }
}
