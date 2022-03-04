#include "GoldBabushka.h"

GoldBabushka::GoldBabushka(const unsigned char* id, unsigned char xorValue) : Babushka(id)
{
    this->xorValue=xorValue;
}

void GoldBabushka::decrypt(unsigned char* data,int size)
{
    for (int i = 0; i < size; i++)
    {
        data[i]=data[i]^xorValue;
        if (data[i]<Babushka::MIN_VALUE_INCLUSIVE) throw UnderflowException();
        else if (data[i]>Babushka::MAX_VALUE_INCLUSIVE) throw OverflowException(); 
    }
    
}

void GoldBabushka::encrypt(unsigned char*data,int size)
{
  for (int i = 0; i < size; i++)
    {
        data[i]=data[i]^xorValue;
        if (data[i]<Babushka::MIN_VALUE_INCLUSIVE) throw UnderflowException();
        else if (data[i]>Babushka::MAX_VALUE_INCLUSIVE) throw OverflowException(); 
    }  
}