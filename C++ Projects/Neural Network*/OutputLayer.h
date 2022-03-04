#ifndef OUTPUTLAYER_H
#define OUTPUTLAYER_H
#include "HiddenLayer.h"


class OutputLayer
{
    private:
    double outputValue;
    double* weights;
    int numWeights;
    

    public:
    OutputLayer(int numWeights, double* weights);
    ~OutputLayer();
    double getOutputValue();
    void setOutputValue(double outputValue);
    void forward(HiddenLayer* lastHiddenLayer);
    void printLayer();
    void clearLayer();

};



#endif