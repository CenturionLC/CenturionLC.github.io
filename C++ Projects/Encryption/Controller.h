#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "Babushka.h"
#include "GoldBabushka.h"
#include "GreenBabushka.h"
#include "RedBabushka.h"
#include "LightBlueBabushka.h"
#include "DarkBlueBabushka.h"
#include "YellowBabushka.h"
#include "ControllerException.h"

#include "ReturnStruct.h"


class Controller
{
private:
    Babushka** babushkaArr;
    int numBabushkas;
    ReturnStruct expandArray(unsigned char* array,int currentSize,const unsigned char* id ,int idSize);
    ReturnStruct reduceArray(unsigned char* array,int currentSize,const unsigned char* expectedId ,int idSize);

public:
    Controller(std::string filePath);
    ~Controller();
    ReturnStruct decrypt(const unsigned char* array,int size) ;
    ReturnStruct encrypt(const unsigned char* array,int size) ; 
    void  printArray(unsigned char* array, int size);


};



#endif