#include "Babushka.h"

Babushka::Babushka(const unsigned char* id)
{
    this->id = id;  // I presume shallow copy?    
}

Babushka::~Babushka()
{
    if (id!=NULL) delete [] id;
}

 const int Babushka::getIdLength() 
{
 return ID_LENGTH;
}

const unsigned char* Babushka::getId()
{
    return id;
}

