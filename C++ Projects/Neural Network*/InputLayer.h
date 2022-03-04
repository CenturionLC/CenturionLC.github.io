#ifndef INPUTLAYER_H
#define INPUTLAYER_H   
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>




class InputLayer
{
    private:
    int numInputs;
    double* inputs;


    public:
    InputLayer(int numInputs);
    ~InputLayer();
    double* getInputs();
    int getNumInputs();
    void setInputs(double* inputs);
    void setNumInputs(int numInputs);
    void printLayer();
    void clearLayer();
    
};



#endif