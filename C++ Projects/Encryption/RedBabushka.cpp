#include "RedBabushka.h"

RedBabushka::RedBabushka(const unsigned char* id,unsigned int rotationAmount): Babushka(id)
{
    this->rotationAmount=rotationAmount;
}

void RedBabushka::encrypt(unsigned char* data, int size)
{
    if (rotationAmount>=size) throw RotateException();


    int i=size-rotationAmount;
    int a=0;
    char T;

    while (i!=size)
    {
        T=data[i];
        for (int k = i; k > a; k--) data[k]=data[k-1];
        
        data[a]=T;
        a++;
        i++;

    }  
}

void RedBabushka::decrypt(unsigned char* data, int size)
{
    if (rotationAmount>=size) throw RotateException();


    int a=size-rotationAmount;
    char T;

    while (a!=size)
    {
        T=data[0];
        for (int k = 0; k < size; k++) data[k]=data[k+1];
        
        data[size-1]=T;
        a++;

    }  
}