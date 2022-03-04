#include "DarkBlueBabushka.h"    //Subtractor

DarkBlueBabushka::DarkBlueBabushka(const unsigned char* id,unsigned int amount) : BlueBabushka(id,amount)
{
    //fetus deletus
}

void DarkBlueBabushka::decrypt(unsigned char* data,int size)
{
    for (int i = 0; i < size; i++)
    {
        
        data[i]+=amount;
        if (data[i]<Babushka::MIN_VALUE_INCLUSIVE) throw UnderflowException();
        else if (data[i]>Babushka::MAX_VALUE_INCLUSIVE) throw OverflowException(); 
    }
    
}

void DarkBlueBabushka::encrypt(unsigned char* data,int size)
{
   for (int i = 0; i < size; i++)
    {
        data[i]-=amount;
        if (data[i]<Babushka::MIN_VALUE_INCLUSIVE) throw UnderflowException();
        else if (data[i]>Babushka::MAX_VALUE_INCLUSIVE) throw OverflowException(); 
    } 
}