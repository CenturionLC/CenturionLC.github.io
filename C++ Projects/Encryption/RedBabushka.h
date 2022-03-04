#ifndef REDBABUSHKA_H
#define REDBABUSHKA_H
#include "Babushka.h"

class RedBabushka: public Babushka
{
private:
    unsigned int rotationAmount;
public:
    RedBabushka(const unsigned char* id,unsigned int rotationAmount);
    void decrypt(unsigned char* data, int size);
    void encrypt(unsigned char* data, int size);
};



#endif