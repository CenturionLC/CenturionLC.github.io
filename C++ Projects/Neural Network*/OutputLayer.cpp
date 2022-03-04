#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "OutputLayer.h"

//Check that all .h files have no namespace std


OutputLayer::OutputLayer(int numWeights,double*weights)
{
    outputValue=0;
    this->numWeights=numWeights;
    this->weights=weights;
}

OutputLayer::~OutputLayer()
{
    if (weights!=NULL)
    {
    delete [] weights;
    weights=NULL;
    }
}

double OutputLayer::getOutputValue()
{
    return outputValue;
}

void OutputLayer::setOutputValue(double outputValue)
{

    this->outputValue=outputValue;
}


void OutputLayer::forward(HiddenLayer* lastHiddenLayer)
{
    double sum=0;
    for (int i = 0; i < lastHiddenLayer->getNumNeurons(); i++)
    {
        double number;
        number=lastHiddenLayer->getNeurons()[i]->getValue();
       sum+= weights[i]*number;
    }
    

    outputValue=sum;
}

void OutputLayer::printLayer()
{
    std::cout <<"o:1" << std::endl;
}

void OutputLayer::clearLayer()
{
    outputValue=0;
}