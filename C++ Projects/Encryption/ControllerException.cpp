#include "ControllerException.h"

ControllerException::ControllerException(std::string customMessage)
{
    this->customMessage=customMessage;
    hasBabushka=false;
}

ControllerException::ControllerException(BabushkaException& babushkaException,std::string customMessage)
{
    this->customMessage=customMessage;
    hasBabushka=true;
    this->babushkaException = &babushkaException;   // might be wrong
}


void ControllerException::printMessage()
{
    std::cout << customMessage << std::endl;

    if (hasBabushka==true) babushkaException->printMessage();
    
}
