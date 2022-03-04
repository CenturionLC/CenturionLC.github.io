#ifndef UNDERFLOWEXCEPTION_H
#define UNDERFLOWEXCEPTION_H
#include "BabushkaException.h"

class UnderflowException:public BabushkaException
{

public:
     void printMessage();
};



#endif