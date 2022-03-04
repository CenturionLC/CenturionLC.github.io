#ifndef HIDDENNEURON_h
#define HIDDENNEURON_h
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "InputLayer.h"

class HiddenLayer;

class HiddenNeuron
{
    private:
    double value;
    int numWeights;
    double* weights;

    public:
    HiddenNeuron(int numWeights, double* weights);
    ~HiddenNeuron();
    double getValue();
    void setValue(double value);
    void forward(HiddenLayer* prevLayer);
    void forward(InputLayer* inputLayer);
    void activateReLU();
    void activateSigmoid();



};

#endif