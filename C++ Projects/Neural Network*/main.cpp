#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include "NeuralNetwork.h"
#include "InputLayer.h"
#include "OutputLayer.h"

using namespace std;

int main()
{
	
	NeuralNetwork* Newton = new NeuralNetwork("/mnt/d/Vs code/Temp/Example NN structures/mean.txt");



	double* input= new double[5];
	input[0]=5.0;
	input[1]=10.0;
	input[2]=15.0;
	input[3]=20.0;
	input[4]=25.0;


	cout << "time for output:" <<std::fixed << std::setprecision( 13 )<< endl << Newton->forward(input) << endl;

	Newton->printNetwork();
	
	InputLayer* yeet = new InputLayer(5);
	yeet->setInputs(input);

	for (int f=0;f<5;f++) 
	{
		cout << yeet->getInputs()[f] << endl;
	}
	cout << "----------------------------------" << endl;
	yeet->setNumInputs(6);

	double* mew= new double[6];
	mew[0]=5.0;
	mew[1]=10.0;
	mew[2]=15.0;
	mew[3]=20.0;
	mew[4]=25.0;
	mew[5]=25.0;

	yeet->setInputs(mew);


	double* mew2= new double[4];
	mew2[0]=5.0;
	mew2[1]=10.0;
	mew2[2]=15.0;
	mew2[3]=20.0;

	yeet->setInputs(mew2);


		yeet->clearLayer();

		yeet->~InputLayer();

	
	/*for (int f=0;f<6;f++) 
	{
		cout << yeet->getInputs()[f] << endl;
	}
	*/

	

	double* mew3= new double[4];
	mew3[0]=5.0;
	mew3[1]=10.0;
	mew3[2]=15.0;
	mew3[3]=20.0;

	double* inpu1t= new double[5];
	inpu1t[0]=5.0;
	inpu1t[1]=10.0;
	inpu1t[2]=15.0;
	inpu1t[3]=20.0;
	inpu1t[4]=25.0;
	
	HiddenNeuron* neuron= new HiddenNeuron(5,inpu1t);

	HiddenNeuron* neuron1= new HiddenNeuron(4,mew3);

	HiddenNeuron** neurons = new HiddenNeuron*[2];

	neurons[0]=neuron;
	neurons[1]=neuron1;



	neurons[0]->setValue(65);
	cout << neurons[0]->getValue() << endl;

	HiddenLayer* hidden = new HiddenLayer(2.0,neurons,"relu");

	double* ip= new double[5];
	inpu1t[0]=5.0;
	inpu1t[1]=10.0;
	inpu1t[2]=15.0;
	inpu1t[3]=20.0;
	inpu1t[4]=25.0;

	double* inp= new double[5];
	inpu1t[0]=5.0;
	inpu1t[1]=10.0;
	inpu1t[2]=15.0;
	inpu1t[3]=20.0;
	inpu1t[4]=25.0;

	double* inpu1= new double[5];
	inpu1t[0]=5.0;
	inpu1t[1]=10.0;
	inpu1t[2]=15.0;
	inpu1t[3]=20.0;
	inpu1t[4]=25.0;



	HiddenNeuron* neuron2= new HiddenNeuron(5,ip);

	HiddenNeuron* neuron3= new HiddenNeuron(5,inp);

	HiddenNeuron* neuron4= new HiddenNeuron(5,inpu1);

	HiddenNeuron** neuronsL = new HiddenNeuron*[3];

	neuronsL[0]=neuron2;
	neuronsL[1]=neuron3;
	neuronsL[2]=neuron4;

	

	hidden->setNeurons(neuronsL);
	hidden->setNumNeurons(3);
	cout << "yeet" << endl;


	
	hidden->~HiddenLayer();



	cout << "----------------------------------" << endl;

	double* meep = new double[5];
	meep[0]=5.0;
	meep[1]=10.0;
	meep[2]=15.0;
	meep[3]=20.0;
	meep[4]=25.0;

	OutputLayer* out= new OutputLayer(5.0,meep);

	out->setOutputValue(11.5);

	cout <<out->getOutputValue() << endl;	
	
	out->clearLayer();
	delete out; //destructoirs

	cout << "----------------------------------" << endl;
	

	

	
	

	Newton->clearNetwork();

	Newton->~NeuralNetwork();
	

	
	







	return 0;
}