#ifndef NEURALNETWORK_H
#define NEURALNETWORK_H
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "HiddenLayer.h"            // Allowed multiple includes?
#include "InputLayer.h"
#include "OutputLayer.h"

class NeuralNetwork
{
    private:
    InputLayer* inputLayer;
    int numHiddenLayers;
    HiddenLayer** hiddenLayers;
    OutputLayer* outputLayer;

    public:
    NeuralNetwork(std::string filePath);
    ~NeuralNetwork();
    double forward(double* input);
    void printNetwork();
    void clearNetwork();


};

#endif
