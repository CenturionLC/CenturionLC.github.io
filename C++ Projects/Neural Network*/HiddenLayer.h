#ifndef HIDDENLAYER_h
#define HIDDENLAYER_h
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "HiddenNeuron.h"

class HiddenLayer
{
    private: 
    int numNeurons;
    HiddenNeuron** neurons;
    std::string activation;

    public:
    HiddenLayer(int numNeurons,HiddenNeuron** neurons, std::string activation);
    ~HiddenLayer();
    HiddenNeuron** getNeurons();
    void setNeurons(HiddenNeuron** neurons);
    int getNumNeurons();
    void setNumNeurons(int numNeurons);
    void forward(HiddenLayer* prevLayer);
    void forward(InputLayer* inputLayer);
    void printLayer();
    void clearLayer();

};





#endif