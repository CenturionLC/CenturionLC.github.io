#include "Datalink.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

Datalink::Datalink()
{
    down = new Physical();
    down->setUp(this);
}

void Datalink::execute(Message* message,bool sending)
{
    if (sending) down->execute(message,true);
    else
    {
        cout << "Message at Datalink layer" << endl;
        up->execute(message,false);
    }
    
}
