#ifndef GOLDBABUSHKA_H
#define GOLDBABUSHKA_H
#include "Babushka.h"

class GoldBabushka:public Babushka
{
    private:
    unsigned char xorValue;
    public:
     GoldBabushka(const unsigned char *id , unsigned char xorValue);
      void decrypt(unsigned char* data,int size);
      void encrypt(unsigned char* data,int size);

};



#endif