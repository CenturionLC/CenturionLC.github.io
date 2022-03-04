#include "GreenBabushka.h"

GreenBabushka::GreenBabushka(const unsigned char* id, unsigned int displacement): Babushka(id)
{
    this->displacement=displacement;
}

void GreenBabushka::encrypt(unsigned char* data,int size)
{
    if (displacement>size-2) throw DisplacementException();

    int Pos=1+displacement,i=0;
    unsigned char T;
        // std::cout << std::endl;
        // std::cout << size << std::endl;



    while (Pos<size)
    {

       // data[Pos]=T;
        T=data[Pos];
        //std::cout <<"Pos: "<< Pos << " ";
        data[Pos]=data[i];
        data[i]=T;

        i=Pos+1;
        Pos=i+displacement+1;
    } 
       // std::cout << std::endl;

}

void GreenBabushka::decrypt(unsigned char* data,int size)
{
    if (displacement>size-2) throw DisplacementException();

    int Pos=1+displacement,i=0;
    char T;

    while (Pos<size)
    {
        

        T=data[Pos];
        data[Pos]=data[i];
        data[i]=T;

        i=Pos+1;
        Pos=i+displacement+1;
    } 
}