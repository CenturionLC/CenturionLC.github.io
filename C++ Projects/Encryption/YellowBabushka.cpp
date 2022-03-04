#include "YellowBabushka.h"

YellowBabushka::YellowBabushka(const unsigned char* id) : Babushka(id)
{
    // Fetus deletus
}

void YellowBabushka::encrypt(unsigned char* data,int size)
{
    int I=size-1;
    char T;
    int a=0;

    while (I!=-1)
    {
       T=data[0];
       for (int i = 0; i < size-a; i++) data[i]=data[i+1];
       
       data[I]=T;
       a++;
       I--;
    }
    
}

void YellowBabushka::decrypt(unsigned char* data,int size)
{
    int I=size-1;
    char T;
    int a=0;

    while (I!=-1)
    {
       T=data[0];
       for (int i = 0; i < size-a; i++) data[i]=data[i+1];
       
       data[I]=T;
       a++;
       I--;
    }
    
}