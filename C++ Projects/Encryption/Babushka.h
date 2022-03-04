#ifndef BABUSHKA_H
#define BABUSHKA_H

#include <cstring>
#include <string>
#include <fstream>
#include <sstream>
#include <iostream>
#include "DisplacementException.h"
#include "UnderflowException.h"
#include "OverflowException.h"
#include "RotateException.h"

class Babushka
{
  protected:
   const unsigned char* id;
   static const int ID_LENGTH=10;
   static const  unsigned char MAX_VALUE_INCLUSIVE=126;
   static const  unsigned char MIN_VALUE_INCLUSIVE=32;
  public:
   Babushka(const unsigned char* id);
   virtual ~Babushka();
    const int getIdLength() ;
    const unsigned char* getId() ;
   virtual void decrypt(unsigned char* data,int size)=0;
   virtual void encrypt(unsigned char* data,int size)=0;
};

// const int Babushka::ID_LENGTH=10;
// const unsigned char Babushka::MAX_VALUE_INCLUSIVE=126;
// const unsigned char Babushka::MIN_VALUE_INCLUSIVE=32;


#endif