#ifndef NETWORK_H
#define NETWORK_H
#include "DataLink.h"
#include "Layer.h"

class Network : public Layer
{
private:
    std::string ip;
    std::string DestIP;
public:
    Network(/* args */);
    void execute(Message* message,bool sending = true);
    void configure(config settings);
};



#endif