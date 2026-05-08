#include <stdio.h>
#include <stdbool.h>
#include "lamp.h"

Lamp createLamp(bool isOn, int color)
{
    Lamp lamp = {isOn} ;
    if (color <= 5)
    {
        lamp.color = color ;
    }
    else
    {
        lamp.color = 0 ;
    }

    return lamp ;
}

void printColor(Lamp * lamp)
{
    if (!(*lamp).isOn)
    {
        printf("La lampe est éteinte.\n") ;
    }
    else if( (*lamp).color == 0)
    {
        printf("Couleur blanche\n");
    }
    else if ( (*lamp).color == 1)
    {
        printf("Couleur rouge\n");
    }
    else if ( (*lamp).color == 2)
    {
        printf("Couleur vert\n");
    }
    else if ( (*lamp).color == 3)
    {
        printf("Couleur jaune\n");
    }
    else if ( (*lamp).color == 4)
    {
        printf("Couleur bleu\n");
    }
    else if ( (*lamp).color == 5)
    {
        printf("Couleur violet\n");
    }
}

void printEtat(Lamp * lamp)
{
    if ((*lamp).isOn)
    {
        printf("La lumière est allumée.\n") ;
    }
    else
    {
        printf("La lumière est éteinte.\n") ;
    }
}

bool isOn(Lamp * lamp)
{
    if ((*lamp).isOn)
    {
        return true ;
    }
    else
    {
        return false ;
    }
}

void swap(Lamp * lamp)
{
    (*lamp).isOn = ! (*lamp).isOn ;
}

void changeColor(Lamp * lamp)
{
    if ((*lamp).isOn)
    {
        (*lamp).color = ((*lamp).color + 1) % 6 ;
    }
}