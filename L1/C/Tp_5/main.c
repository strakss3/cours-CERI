#include "lamp.h"
#include "rectangle.h"
#include "matrix.h"
#include "pollution.h"


/* Exo 1.1
int main()
{
    Lamp luminaire = createLamp(true, 0) ;
    
    printColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.2
int main()
{
    Lamp luminaire = createLamp(true, 0) ;
    
    printEtat(&luminaire) ;
    printColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.3
int main()
{
    Lamp luminaire = createLamp(true, 0) ;
    
    printEtat(&luminaire) ;
    printColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.4
int main()
{
    Lamp luminaire = createLamp(true, 0) ;
    
    printEtat(&luminaire) ;
    printColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.4 bis
int main()
{
    int colorAtStart ;
    printf("Quelle couleur à l'llumage : ") ;
    scanf("%d", &colorAtStart) ;
    
    Lamp luminaire = createLamp(true, colorAtStart) ;
    
    printEtat(&luminaire) ;
    printColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.5
int main()
{
    int colorAtStart ;
    printf("Quelle couleur à l'llumage : ") ;
    scanf("%d", &colorAtStart) ;
    
    Lamp luminaire = createLamp(true, colorAtStart) ;
    
    printEtat(&luminaire) ;
    printColor(&luminaire) ; 
    
    printf("\nChangement de l'état du luminaire :\n\n") ;
    swap(&luminaire) ;
    
    printEtat(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 1.6
int main()
{  
    Lamp luminaire = createLamp(false, 1) ;
    
    printEtat(&luminaire) ; 
    swap(&luminaire) ;
    printEtat(&luminaire) ; 
    
    for (int i = 0 ; i < 10 ; i++)
    {
        changeColor(&luminaire) ;
        printColor(&luminaire) ;
    }
    
    swap(&luminaire) ;
    printEtat(&luminaire) ; 
    
    return 0 ;
}
*/

/* Exo 1.7
int main()
{
    Lamp luminaire = createLamp(false, 0) ;
    
    printColor(&luminaire) ;
    changeColor(&luminaire) ;
    
    return 0 ;
}
*/

/* Exo 2
int main()
{
    double height ;
    double width ;
    double area ;
    double diagonal ;
    bool square ;
    
    printf("Longeur du rectangle : ") ;
    scanf("%lf", &height) ;
    printf("Largeur du rectangle : ") ;
    scanf("%lf", &width) ;
    
    Rectangle rectangle = createRectangle(height, width) ;
    area = getArea(&rectangle) ;
    diagonal = getDiagonal(&rectangle) ;
    printf("Surface : %f\n", area) ;
	printf("Diagonale : %f\n", diagonal) ;
    
    if (isSquare(&rectangle))
    {
        printf("La forme est un carré.\n") ;
    }
    else
    {
        printf("La forme n'est pas un carré.\n") ;
    }
    
    return 0 ;
}
*/

/* Exo 3
int main()
{
    Matrix mat = createMatrix() ;
    fillMatrix(&mat) ;
    display(&mat) ;
    printf("La trace de la matrice vaut : %d\n", diagSum(&mat)) ;
    
    Matrix transposeMat = transposedMatrix(&mat) ;
    printf("La transposée de la matrice est : \n") ;
    display(&transposeMat) ;
    
    return 0 ;
}
*/

/* Exo 4 */
int main()
{
    PollutingProject test = createProject(12) ;
	PollutingProject test2 = createProject(13) ;
    
    displayMeasures(&test) ;

    addMeasure(&test, 5) ;
    addMeasure(&test, 0) ;
    addMeasure(&test, 50) ;

    displayMeasures(&test) ;
    
    printf("Le pire des deux c'est : %d\n", (worseThan(&test, &test2))->id) ;

    printf("La valeur moyenne est : %f\n", mean(&test)) ;

    return 0 ;
}

