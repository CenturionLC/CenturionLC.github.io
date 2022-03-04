#include "Transport.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;
Transport::Transport()
{
    down = new Network();
    down->setUp(this);
}

void Transport::execute(Message* message,bool sending)
{
    if (sending)
    {
       if (message->setOriginPort(port)==false)
       {
           cout << "ERROR OCCURRED WITH ORIGIN PORT" << endl;
           return;
       } 
         
       //cout << DestPort<< endl;      
       if (message->setDestinationPort(DestPort)==false)
       {
           cout << "ERROR OCCURRED WITH DESTINATION PORT" << endl;
           return;
       } 

       down->execute(message,sending);
    }
    else
    {
        // cout << "DestPort: " << DestPort << endl;
        // cout << "geter: " << message->getDestinationPort() << endl;


        if (message->getDestinationPort()!=port)
        {
           cout << "Message sent to wrong port" << endl;
           message->PrintMessage();
        }
        

        if (message->getData().length()!=message->getContentLength())
        {
            cout << "Content Length error" << endl;
            message->PrintMessage();
        }

        if (message->getDestinationPort()==port && message->getContentLength()==message->getData().length())
        {
            cout << "Message at Transport layer" << endl;
            up->execute(message,false);
        }
        
        
    }
    
}


void Transport::configure(config settings)
{
    port=settings.port;
    DestPort=settings.DestPort;
    //cout << "Dest Port: " << DestPort << endl;
    Layer::configure(settings);
    
}