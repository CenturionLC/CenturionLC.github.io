#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "InputLayer.h"



InputLayer::InputLayer(int numInputs)
{
    this->numInputs=numInputs;
    inputs=NULL;
}

InputLayer::~InputLayer()
{
    if (inputs!=NULL)
    delete [] inputs;
    inputs=NULL;
}

double* InputLayer::getInputs()
{
    return inputs;
}

int  InputLayer::getNumInputs()
{
    return numInputs;
}


void InputLayer::setInputs(double* inputs)
{
   if (this->inputs!=NULL)  delete [] this->inputs;

   this->inputs = inputs;
   
}


void InputLayer::setNumInputs(int numInputs)
{
    this->numInputs = numInputs;
}

void InputLayer::printLayer()
{
    std::cout << "i :" << numInputs << std::endl;
    
}
void InputLayer::clearLayer()
{
    if (this->inputs!=NULL)
    {
        for (int i = 0; i < numInputs; i++)
        {
           inputs[i]=0;
        }
        
    }
}



