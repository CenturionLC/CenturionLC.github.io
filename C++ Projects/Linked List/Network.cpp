#include "Network.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;
Network::Network()
{
    down = new Datalink();
    down->setUp(this);
}

void Network::execute(Message* message,bool sending)
{
    //cout << DestIP << endl;
    //cout << message->getDestinationIP() << endl;
    if (sending)
    {
        if (message->setOriginIP(ip)==false)
        {
           cout << "ERROR OCCURRED WITH ORIGIN IP" << endl;
           return;
        }
        if (message->setDestinationIP(DestIP)==false)
        {
           cout << "ERROR OCCURRED WITH DESTINATION IP" << endl;
           return;
           
        }          
        down->execute(message,true);
    }
    else
    {
        // cout << "ip: " << ip << endl;
        // cout << message->getDestinationIP() << endl;
        
        if (message->getDestinationIP()==ip)
        {
            cout << "Message at Network layer" << endl;
            up->execute(message,false);
        }
        else
        if (message->getOriginIP()==ip)
        {
            cout << "Message has been returned to sender without finding the destination" << endl;
            message->PrintMessage();
        }
        else
        {
            cout << "Message at Network layer" << endl;
            down->execute(message,true);
        }
        
        
    }
    
}

void Network::configure(config settings)
{
    ip = settings.ip;
    DestIP = settings.DestIP;
    Layer::configure(settings);
}