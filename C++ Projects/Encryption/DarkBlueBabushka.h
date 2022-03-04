#ifndef DARKBLUEBABUSHKA_H 
#define DARKBLUEBABUSHKA_H
#include "BlueBabushka.h"



class DarkBlueBabushka:public BlueBabushka
{
 public:
    DarkBlueBabushka(const unsigned char* id,unsigned int amount );
     void decrypt(unsigned char* data,int size);
     void encrypt(unsigned char* data,int size);
};

//Subtractor


#endif