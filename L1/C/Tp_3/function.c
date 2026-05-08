#include <stdio.h>
#include <stdbool.h>
#include "function.h"

// ---------- Exo 2.1 ----------

void addOne ( int * number )
{
    *number += 1 ;
}

// ---------- Exo 2.2 ----------

void getOpposite(int * value)
{
    *value = - *value ;
}

// ---------- Exo 2.3 ----------

bool isPositive(double value)
{
    if (value > 0)
    {
        return true ;
    }
    else
    {
        return false ;
    }
}

void modify(double * number)
{
    bool sign ;

    sign = isPositive(*number) ;   
    if (sign)
    {
        *number /= 2 ;
    }
    else
    {
        *number *= 3 ; 
    }
}

// ---------- Exo 2.4 ----------

void distributeBonus(double * salary1, double * salary2, double * salary3, double bonus)
{
    bonus /= 3 ;
    *salary1 += bonus ;
    *salary2 += bonus ;
    *salary3 += bonus ;
}

// ---------- Exo 2.5 ----------

bool check(double number1, double number2)
{
    if (number1 <= number2)
    {
        return true ;
    }
    else
    {
        return false ;
    }
}

void modify2(double * min, double * max)
{
    *min *= 2 ;
    *max /= 2 ;
}

// -------- Exo 2.5 bis ---------

void swap(double * min, double * max)
{
    double tmp = *min ;
    *min = *max ;
    *max = tmp ;
}

// ---------- Exo 2.6 ----------

void sort(double * a, double * b, double * c)
{
    if (*a > *b)
    {
        swap(a, b) ;
    }
    if (*a > *c)
    {
        swap(a, c) ;
    }
    if (*b > *c)
    {
        swap(b, c) ;
    }
}

// ---------- Exo 3.1 ----------

void arithmetic(double a, double b, double * sum, double * product)
{
    *sum = a + b ;
    *product = a * b ;
}

// ---------- Exo 3.2 ----------

void minMax(int a, int b, int c, int * min, int * max)
{
    *min = a ;
    *max = a ;
    if (b < *min)
    {
        *min = b ;
    }
    if (c < *min)
    {
        *min = c ;
    }
    if (b > *max)
    {
        *max = b ;
    }
    if (c > *max)
    {
        *max = c ;
    }
}

// ---------- Exo 3.3 ----------

void logic(bool bool1, bool bool2, bool * valAnd, bool * valOr, bool * valXor)
{
    *valAnd = (bool1 && bool2) ;
    *valOr = (bool1 || bool2) ;
    *valXor = (bool1 ^ bool2) ;
}
