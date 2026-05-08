#include <stdio.h>
#include <stdbool.h>

typedef struct
{
    bool isOn ;
    int color ;
} Lamp ;

Lamp createLamp(bool isOn, int color) ;
void printColor(Lamp * lamp) ;
void printEtat(Lamp * lamp) ;
bool isOn(Lamp * lamp) ;
void swap(Lamp * lamp) ;
void changeColor(Lamp * lamp) ;