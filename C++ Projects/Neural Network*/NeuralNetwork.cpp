#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "NeuralNetwork.h"

NeuralNetwork::NeuralNetwork(std::string filepath)
{
    std::ifstream infile;
    //filepath=filepath+".txt";
    const char* C = filepath.c_str();             // are we allowed to use this function
    

    infile.open(C);
    if (infile)
 {

    std::string line;
    int num,pos;
    

    getline(infile,line);
    //std::cout  <<"line: " << line << std::endl;

    pos=line.find(":");
    line.erase(0,pos+1);

    //std::cout  <<"line: " << line << std::endl;

    std::stringstream beako;
    beako << line;
    beako >> num;
    beako.clear();
    //std::cout  <<": " << num << std::endl;

    inputLayer = new InputLayer(num);
    

    getline(infile,line);

    pos=line.find(":");
    line.erase(0,pos+1);

    

    beako << line;
    beako >> num;

    numHiddenLayers=num;

    beako.clear();

    int count=0;
    int numWeights;
    int numNeurons;
    hiddenLayers =  new HiddenLayer*[numHiddenLayers];
               
    while (count<numHiddenLayers)
    {
        pos=0;
        std::string temp,activation;

        
          getline(infile,line);

          pos=line.find(":");
          line.erase(0,pos+1);  

          pos=line.find(":");

          temp=line.substr(0,pos);            
          beako << temp;
          beako >> numNeurons;
          beako.clear();

          double* weights;
          if (count==0) numWeights=inputLayer->getNumInputs(); // input layer

          else  numWeights= hiddenLayers[count-1]->getNumNeurons(); // previous hidden layer

          //std::cout  <<": " << numNeurons << std::endl;

          
           
          
          



          line.erase(0,pos+1); 
          activation=line;
          temp="";
          
          HiddenNeuron** neurons= new HiddenNeuron*[numNeurons];

          for (int i = 0; i < numNeurons; i++)   // rows
          {
              getline(infile,line);
              weights = new double[numWeights];

               for (int k  = 0; k < numWeights; k++)
             { 
                 pos=line.find(" ");
                 if (pos!=-1)
                  {
                     temp=line.substr(0,pos);   
                     line.erase(0,pos+1);
                  }
                  else 
                  temp=line;
                  beako << temp;
                  beako >> weights[k];
                  
                  beako.clear();
                  

              }

                neurons[i] = new HiddenNeuron(numWeights,weights); 
                weights=NULL;
          }


          //-------------------------------------------------------------------------------------------------------------------
          hiddenLayers[count]= new HiddenLayer(numNeurons,neurons,activation);
 
          
        

          neurons=NULL;
        
            
         count++;

        
    }

    getline(infile,line);   //useless line

    double* weights;
    numWeights=hiddenLayers[count-1]->getNumNeurons();
    //std::cout  <<": " << numWeights << std::endl;

    weights = new double[numWeights];

    getline(infile,line);

    pos=0;
    std::string temp;

    for (int a  = 0; a < numWeights; a++)
    {
                 beako.clear();
                 pos=line.find(" ");
                 if (pos!=-1)
                  {
                     temp=line.substr(0,pos);   
                     line.erase(0,pos+1);
                  }
                  else 
                  temp=line;
                  beako << temp;
                  beako >> weights[a];

                  //std::cout << a <<": " << weights[a] << std::endl;

    }

    outputLayer = new OutputLayer(numWeights,weights);

    infile.close();
 }
}

NeuralNetwork::~NeuralNetwork()
{
    inputLayer->~InputLayer();

    //std::cout << "eto" << std::endl;

    for (int i = 0; i < numHiddenLayers; i++)
    {
        
        hiddenLayers[i]->~HiddenLayer();
        
            
    }
    delete [] hiddenLayers;
    hiddenLayers=NULL;
    numHiddenLayers=0;

    outputLayer->~OutputLayer();

}

double NeuralNetwork::forward(double* input)
{
    
    inputLayer->setInputs(input);

    
    

    for (int i = 0; i < numHiddenLayers; i++)
    {
        if (i==0)
         {
          hiddenLayers[i]->forward(inputLayer);
         }
           else
          hiddenLayers[i]->forward(hiddenLayers[i-1]);
    }
    outputLayer->forward(hiddenLayers[numHiddenLayers-1]);
    
    return outputLayer->getOutputValue();
}

void NeuralNetwork::printNetwork()
{
    inputLayer->printLayer();
    for (int i = 0; i < numHiddenLayers; i++)
    {
       hiddenLayers[i]->printLayer();
    }

    outputLayer->printLayer();
    
    
}

void NeuralNetwork::clearNetwork()
{
   inputLayer->clearLayer();
    for (int i = 0; i < numHiddenLayers; i++)
    {
       hiddenLayers[i]->clearLayer();
    }

    outputLayer->clearLayer(); 
}