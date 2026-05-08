#include <stdio.h>
#include <stdbool.h>

typedef struct
{
    int id ;
    int pollutionMeasures[5] ;

} PollutingProject ;

PollutingProject createProject(int id) ;
void addMeasure(PollutingProject * project, int value) ;
void displayMeasures(PollutingProject * project) ;
double mean(PollutingProject * project) ;
PollutingProject * worseThan(PollutingProject *project1, PollutingProject *project2) ;
