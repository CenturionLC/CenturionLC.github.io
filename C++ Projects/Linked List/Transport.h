#ifndef TRANSPORT_h
#define TRANSPORT_h
#include "Layer.h"
#include "Network.h"

class Transport: public Layer
{
private:
    std::string port;
    std::string DestPort;
    public:
    Transport(/* args */);
    void execute(Message* message,bool sending=true);
    void configure(config settings);
    
};


#endif