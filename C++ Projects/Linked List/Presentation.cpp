#include "Presentation.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

Presentation::Presentation()
{
    down = new Transport();
    down->setUp(this);
}

void Presentation::execute(Message* message,bool sending)
{
    if (sending)
    {
        message->setEncoding(encoding);
        down->execute(message,sending);
    }
    else
    {
      if (message->getEncoding()==encoding)
      {
        cout << "Message at Presentation layer on computer: " << computerName << endl;
        up->execute(message,false);
      }
      else
      {
          cout << "Encoding type mismatch on computer: " << computerName << " Expected: " << encoding << endl;
          message->PrintMessage();
      }
    }
    
}

void Presentation::configure(config settings)
{
    encoding = settings.encoding;
    Layer::configure(settings);
}