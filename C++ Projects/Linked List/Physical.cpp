#include  "Physical.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

Physical::Physical()
{
    next = NULL;
}

void Physical::execute(Message* message,bool sending)
{
    // cout << "jan" << endl;
    // cout << "next: " << next->computerName << endl;
    if (sending)
    {
        if (next==NULL)
        {
            cout << "NOT CONNECTED TO A NETWORK" << endl;
            message->PrintMessage();

        }
        else
        {
            //cout << "next: " << next->computerName << endl;
            next->execute(message,false);
        } 
                
    }
    else
    {
        cout << "Message at Physical layer of computer: " << computerName << endl;
        up->execute(message,false);
    }
}

Physical::~Physical()
{
    Physical* san = next;
    //cout << "helllo" << endl;
    if (this->next!=NULL)
    {
        while (san->next!=this) san = san->next;

        san->next = this->next;
    }
    
    
    
 
}

void Physical::link(Layer* LinkStack)
{
    Physical* jan;
    Layer* kan = LinkStack;

    while (kan->getDown()!=NULL) kan = kan->getDown();

    jan = dynamic_cast<Physical*>(kan);
    if (next!=NULL )
    {
         jan->next = next;
         next = jan;
    }
    else
    {
        jan->next = this;
        next = jan;
    }
    
   
    
}

Physical* Physical::getNext()
{
    return next;
}

void Physical::setNext(Physical* newNext)
{
    next = newNext;
}

void Physical::configure(config settings)
{
    computerName = settings.computerName;
    //yeet
}