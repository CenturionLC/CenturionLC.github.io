#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "HiddenNeuron.h"
#include "HiddenLayer.h"

HiddenNeuron::HiddenNeuron(int numWeights,double* weights)
{
    this->numWeights=numWeights;
    this->weights= weights;
    value=0;   
}

HiddenNeuron::~HiddenNeuron()
{
    if (weights!=NULL)
    {
    delete [] weights;
    weights=NULL;
    }
}

double HiddenNeuron::getValue()
{
    return value;
}

void HiddenNeuron::setValue(double value)
{
    this->value=value;
}

void HiddenNeuron::forward(HiddenLayer* prevLayer)
{
    double sum=0;


    for (int i = 0; i < numWeights; i++)
    {
        double number;
        number=prevLayer->getNeurons()[i]->getValue();
        //std::cout << number << std::endl;
        sum+= weights[i]*number;

    }
    




    value = sum;
}


void HiddenNeuron::forward(InputLayer* inputLayer)
{
    double sum=0;
    double* number;
    number=inputLayer->getInputs();

    for (int i = 0; i < numWeights; i++)
    {
        sum+= weights[i]*number[i];     // Do this for above function
    }
    




    value = sum;
}

void HiddenNeuron::activateReLU()
{   

   //std::cout <<i <<": " << value<< std::endl;
  if (value<0) value=0;
  else
  value=value;
}

void HiddenNeuron::activateSigmoid()
{
    //std::cout  <<": " << value<< std::endl;
    value=value*-1;
    value= 1/(1+exp(value));
}