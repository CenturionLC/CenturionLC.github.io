#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "HiddenLayer.h"

HiddenLayer::HiddenLayer(int numNeurons, HiddenNeuron** neurons, std::string activation)
{
    this->numNeurons=numNeurons;
    this->neurons=  neurons;
    this->activation=activation;
}

HiddenLayer::~HiddenLayer()
{
    if (neurons!=NULL)
    {
     for (int i = 0; i < numNeurons; i++)
     {
         neurons[i]->~HiddenNeuron();
     }
     delete [] neurons;
     neurons=NULL;
    } 
}

HiddenNeuron** HiddenLayer::getNeurons()
{
    return neurons;
}

void HiddenLayer::setNeurons(HiddenNeuron** neurons)
{
    if (this->neurons!=NULL)
    {
        //std::cout << numNeurons << std::endl;
        for (int i = 0; i < numNeurons; i++)
        {
            //std::cout <<this->neurons[i]->getValue() << std::endl;
            this->neurons[i]->~HiddenNeuron();
           //std::cout <<  "i: "<<i  << std::endl;
        }
      //  std::cout <<"------------------" << std::endl;
        delete [] this->neurons;  
        neurons=NULL;
        
    }
    this->neurons=neurons;
}


int HiddenLayer::getNumNeurons()
{
    return numNeurons;
}

void HiddenLayer::setNumNeurons(int numNeurons)
{
    this->numNeurons=numNeurons;
}

void HiddenLayer::forward(HiddenLayer* prevlayer)
{
    for (int i = 0; i < numNeurons; i++)
    {
       
       neurons[i]->forward(prevlayer);
       //std::cout << i <<": " << neurons[i]->getValue() << std::endl;
       if (activation=="relu") neurons[i]->activateReLU();
        else
       if (activation=="sigmoid") neurons[i]->activateSigmoid();
        //std::cout << i <<": " << neurons[i]->getValue() << std::endl;

         //std::cout << i <<": " << neurons[i]->getValue() << std::endl;
        
    }   
    
    
}

void HiddenLayer::forward(InputLayer* inputLayer)
{
    for (int i = 0; i < numNeurons; i++)
    {
       
       neurons[i]->forward(inputLayer);
        
       if (activation=="relu") neurons[i]->activateReLU();
        else
       if (activation=="sigmoid") neurons[i]->activateSigmoid();
    //std::cout << i <<": " << neurons[i]->getValue() << std::endl;

    }  
}

void HiddenLayer::printLayer()
{
    std::cout <<"h:" << numNeurons << ":" << activation << std::endl;
}


void HiddenLayer::clearLayer()
{
  if(neurons!=NULL)
    for (int i = 0; i < numNeurons; i++)
    {
       neurons[i]->setValue(0) ;
    }
    
    
}
