#ifndef CONTROLLEREXCEPTION_H
#define CONTROLLEREXCEPTION_H

#include "Babushka.h"


class ControllerException
{
private:
    BabushkaException* babushkaException;
    bool hasBabushka;
    std::string customMessage;
public:
    ControllerException(std::string customMessage );
    ControllerException(BabushkaException& babushkaException,std::string customMessage);
    void printMessage();
};






#endif