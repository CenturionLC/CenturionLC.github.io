#include "Application.h"

using namespace std;

Application::Application()
{
    down = new Presentation();
    down->setUp(this);
}

void Application::execute(Message* message,bool sending)
{
    if (sending) down->execute(message,sending);
    else
    
        cout << "Computer " << computerName << " Received message: " << message->getData() << endl;     
}

void Application::execute(string data,int contentLength)
{
    Message* jan = new Message(data);
    jan->setContentLength(contentLength);
    down->execute(jan,true);
}