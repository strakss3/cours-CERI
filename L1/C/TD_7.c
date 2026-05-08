#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

/* Exo 1
void addDonation(int *total, int donation) 
{
    *total += donation ;
}

void processDonors(int *total, int numDonations) 
{
    int *newDonation = malloc(sizeof(int)) ;
    for ( int i = 0 ; i < numDonations ; i++ )
    {
        scanf("%d", newDonation) ;
        addDonation(total, *newDonation) ;
    }
    free(newDonation) ;
}

int main() 
{
    int *totalDonations ;
    *totalDonations = 0 ;
    processDonors(totalDonations, 5); 
    printf("Total des dons : %d\n", *totalDonations);
}
*/

/* Exo 2
void modify(int* ptr, int value) {
    *ptr = value;
}

void allocateAndModify(int** ptr) {
    *ptr = malloc( sizeof(int) );  
    **ptr = 10;
}

void cleanup(int* ptr) {
    free(ptr);  
}

int main() {
    int* ptrA = NULL;  
    int* ptrB = NULL; 
    
    printf("%p\n", ptrA);		// NULL
    printf("%d\n", *ptrB);		// problème car on peut pas acceder à la valeur de rien

    allocateAndModify(&ptrA);
    printf("%d\n", *ptrA);		// 10

    modify(ptrA, 50); 
    printf("%d\n", *ptrA);		// 50

    cleanup(ptrA);
    printf("%p\n", ptrA);		// ptrA à été free donc problème
    printf("%d\n", *ptrA);		// pareil
    ptrA = NULL;  
    printf("%p\n", ptrA);		// NULL
    
}
*/

/* Exo 3
void addExpense(int *day) {
	
	scanf("%d", day) ;
}

void manageExpenses(int *month) {
	
	for (int i = 0 ; i < 3 ; i++) {
		
		addExpense(&month[i]) ;
	}
}

void displayArray(int *array, int size) {

	printf("{%d", array[0]) ;
	for (int i = 1 ; i < size ; i++){

		printf(" %d", array[i]) ;
	}
	printf("}\n") ;	
}


int main() {
	
	int numOfDays = 31 ;
	int *month = malloc(numOfDays * sizeof(int)) ;
	
	manageExpenses(month) ;
	displayArray(month, numOfDays) ;
	
	return 0 ;
}
*/

/* Exo 4
bool bookSeat(int *reservations, int nbSections, int *emptySeats, int numSeatsReserved)
{
    if( *emptySeats >= numSeatsReserved)
    {
        int numSection;
        scanf("%d", numSection);
        if (numSection < nbSections)
        {
            reservations[numSection] = reservations[numSection]+numSeatsReserved;
            *emptySeats = *emptySeats - numSeatsReserved;
        }
        return true;
    }
    return false;
}

void processBookings (int *reservations, int nbSections, int *emptySeats)
{
    int nbReservations;
    scanf("%d", nbReservations);
    
    for (int i = 0; i< nbReservations; i = i +1)
    {
        int numSection;
        scanf("%d", numSection);
        int numSeatsReserved;
        scanf("%d",  numSeatsReserved);
        bookSeat(reservations, nbSections, emptySeats, numSeatsReserved);
    }
}
    
int main()
{
    int seatsAvailable;
    scanf("%d",  seatsAvailable);
    int nbSections;
    scanf("%d",  nbSections);
    int *reservations = malloc(nbSections * sizeof(int));
    processBookings(reservations, nbSections, &seatsAvailable);
    
    printf("%d\n",  seatsAvailable);
    for(int i = 0; i < nbSections ; i = i +1)
    {
        printf("%d ", reservations[i]);
    }
}
*/

/* Exo 5
void fillWithRandom(int *array, int size)
{
    srand(time(0));
    for(int i = 0; i < size; i++)
    {
        array[i] = rand()%100+1; //chiffre entre 1 et 100
    }
}

int * createArray(int size)
{
    int * array = malloc(size * sizeof(int));
    fillWithRandom(array, size);
    return array;
}

int* findMax(int *array, int size)
{
    int *pMax = array;//on pointe vers la première case
    for( int i = 1; i < size; i = i +1)
    {
        if (array[i]> *pMax)
        {
            pMax = &array[i];
        }
    }
    return pMax;
}

void resetMax(int *array, int size, int nbLoops)
{
    for (int i = 0; i < nbLoops; i = i +1)
    {
        int * pMax = findMax(array, size);
        *pMax = 0;
    }
}

int main()
{
    int size;
    scanf("%d", size);
    
    int * array = createArray(size);
    
    for (int i = 0; i < size; i = i +1) //affichage
    {
        printf("%d ", array[i]);
    }
    printf("\n");
    
    int nbReset;
    scanf("%d", nbReset);
    resetMax(array, size, nbReset);
    
    for (int i = 0; i < size; i = i +1) //affichage
    {
          printf("%d ", array[i]);
    }
    printf("\n");
}
*/
