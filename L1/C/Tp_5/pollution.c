#include "pollution.h"

PollutingProject createProject(int id)
{
    PollutingProject project = {id, {-1, -1, -1, -1, -1}} ;
    return project ;
}

void addMeasure(PollutingProject * project, int value)
{
    for (int i = 0 ; i < 4 ; i++)
    {
        (*project).pollutionMeasures[i] = (*project).pollutionMeasures[i+1] ;
    }
    (*project).pollutionMeasures[4] = value ;
}

void displayMeasures(PollutingProject * project)
{
    printf("Valeurs pour %d :", (*project).id) ;
    for (int i = 0 ; i < 5 ; i ++)
    {
        if ((*project).pollutionMeasures[i] == -2)
        {
            continue ;
        }
        printf(" %d", (*project).pollutionMeasures[i]) ;
    }
    printf("\n") ;
}

double mean(PollutingProject * project)
{
    double mean = 0 ;
    int count = 0 ;

    for (int i = 0 ; i < 5 ; i ++)
    {
        if ((*project).pollutionMeasures[i] != -1)
        {
            mean += (*project).pollutionMeasures[i] ;
            count ++ ;
        }
    }
    return mean/count ;
}

PollutingProject * worseThan(PollutingProject *project1, PollutingProject *project2)
{
	double mean1 = mean(project1) ;
	double mean2 = mean(project2) ;
	
	if (mean1 < mean2)
	{
		return project2 ;
	}
	else
	{
		return project1 ;
	}
}

