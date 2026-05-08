#include <stdio.h>
#include <stdbool.h>
#include "function.h"

/* Exo 1.1
int main()
{
    int age ;
    int *pAge = &age ;

    printf("La valeur de age en direct : ") ;
    scanf("%d", &age) ;
    printf("La valeur vers laquelle pointe pAge : %d\n", *pAge) ;
    
    return 0 ;
}
*/

/* Exo 1.2
int main()
{
    int age = 18 ;
    int *pAge = &age ;

    *pAge = 25 ;
    
    printf("%d\n", age) ;
    
    return 0 ;
}
*/

/* Exo 1.3 
int main()
{
    int age ;
    int *pAge = &age;
    
    printf("Quel est votre age : ") ;
    scanf("%d", &age) ;
    printf("La valeur vers laquelle pointe pAge : %d\n", *pAge) ;
    
    return 0 ;
}
*/

/* Exo 1.4
int main()
{
    double price = 100.50 ;
    bool isActive = true ;
    double *pPrice = &price;
    bool *pIsActive = &isActive ;
    
    *pPrice = 150.75 ;
    *pIsActive = false ;
    
    printf("La valeur de price est : %f\n", price) ;
    printf("La valeur de isActive est : %d\n", isActive) ;
    
    return 0 ;
}
*/

/* Exo 2.1
int main() {
    int age ;
    
    printf("Quel âge avez vous : ") ;
    scanf("%d", &age) ;
    addOne(&age) ;
    printf("Votre âge l'an prochain : %d.\n", age) ;
    
    return 0 ;
}
*/

/* Exo 2.2
int main()
{
    int number ;
    
    printf("Saisir un nombre : ") ;
    scanf("%d", &number) ;
    getOpposite(&number) ;
    printf("L'opposé est : %d\n", number) ;
    
    return 0 ;
}
*/

/* Exo 2.3
int main()
{
    double number ;
    
    printf("Saisir un nombre : ") ;
    scanf("%lf", &number) ;
    modify(&number) ;
    printf("Valeur finale : %f\n", number) ;
    
    return 0 ;
}
*/

/* Exo 2.4
int main()
{
    double salary1 ;
    double salary2 ;
    double salary3 ;
    double bonus ;
    
    printf("Salaire du premier salarié : ") ;
    scanf("%lf", &salary1) ;
    printf("Salaire du deuxième salarié : ") ;
    scanf("%lf", &salary2) ;
    printf("Salaire du troisième salarié : ") ;
    scanf("%lf", &salary3) ;
    printf("Valeur du bonus : ") ;
    scanf("%lf", &bonus) ;
    
    distributeBonus(&salary1, &salary2, &salary3, bonus) ;
    printf("Salaire total des salariés : %f, %f, %f \n", salary1, salary2, salary3) ;
    
    return 0 ;
}
*/

/* Exo 2.5
int main()
{
    double min ;
    double max ;
    
    printf("Entrez le min : ") ;
    scanf("%lf", &min) ;
    printf("Entrez le max : ") ;
    scanf("%lf", &max) ;
    
    while (!check(min, max))
    {
        printf("Vos nombres ne sont pas corrects.\n\n") ;
        printf("Entrez le min : ") ;
        scanf("%lf", &min) ;
        printf("Entrez le max : ") ;
        scanf("%lf", &max) ;
    }
    printf("Vos nombres sont corrects.\n") ;
    modify2(&min, &max) ;
    printf("Résultat min = %f et max = %f ", min, max) ;
    if (check(min, max))
    {
        printf("(ils respectent l'ordre).\n") ;
    }
    else
    {
        printf("(ils ne respectent pas l'ordre).\n") ;
    }
    
    return 0 ;
}
*/

/* Exo 2.5 bis
int main()
{
    double min ;
    double max ;
    
    printf("Entrez le min : ") ;
    scanf("%lf", &min) ;
    printf("Entrez le max : ") ;
    scanf("%lf", &max) ;
    
    if (check(min, max))
    {
        printf("Vos nombres sont corrects.\n") ;
    }
    else
    {
        swap(&min, &max) ;
        printf("min et max ont été inversés automatiquement.\n") ;
    }
    
    modify2(&min, &max) ;
    
    if (check(min, max))
    {
        printf("Résultat min = %f et max = %f ", min, max) ;
        printf("(ces nombres respètent l'ordre).\n") ;
    }
    else
    {
        swap(&min, &max) ;
        printf("Résultat min = %f et max = %f ", min, max) ;
        printf("(min et max ont été inversés automatiquement).\n") ;
    }
    
    return 0 ;
}
*/

/* Exo 2.6
int main()
{
    double a ;
    double b ;
    double c ;
    
    printf("Valeur de a : ") ;
    scanf("%lf", &a) ;
    printf("Valeur de b : ") ;
    scanf("%lf", &b) ;
    printf("Valeur de c : ") ;
    scanf("%lf", &c) ;
    
    sort(&a, &b ,&c) ;
    printf("Après le tri : a = %f, b = %f, c = %f\n", a, b, c) ;
    
    return 0 ;
}
*/

/* Exo 3.1
int main()
{
    double a ;
    double b ;
    double sum ;
    double product ;
    
    printf("Saisir a : ") ;
    scanf("%lf", &a) ;
    printf("Saisir b : ") ;
    scanf("%lf", &b) ;
    
    arithmetic(a, b, &sum, &product) ;
    printf("a + b = %f\n", sum) ;
    printf("a * b = %f\n", product) ;
    
    return 0 ;
}
*/

/* Exo 3.2
int main()
{
    int a ;
    int b ;
    int c ;
    int min ;
    int max ;
    
    printf("Valeur de a : ") ;
    scanf("%d", &a) ;
    printf("Valeur de b : ") ;
    scanf("%d", &b) ;
    printf("Valeur de c : ") ;
    scanf("%d", &c) ;
    
    minMax(a, b, c, &min, &max) ;
    printf("min = %d et max = %d\n", min, max) ;
    
    return 0 ;
}
*/

/* Exo 3.3
int main()
{
    bool bool1 ;
    bool bool2 ;
    bool valAnd ;
    bool valOr ;
    bool valXor ;
    
    printf("Première valeur : ") ;
    scanf("%d", &bool1) ;
    printf("Deuxième valeur : ") ;
    scanf("%d", &bool2) ;
    
    logic(bool1, bool2, &valAnd, &valOr, &valXor) ;
    printf("AND : %d\n", valAnd) ;
    printf("OR : %d\n", valOr) ;
    printf("XOR : %d\n", valXor) ;
    
    return 0 ; 
}
*/
