#ifndef APPLICATION_H
#define APPLICATION_H
#include "Layer.h"
#include "Presentation.h"

class Application: public Layer
{
    public:
    Application();
    void execute(Message* message,bool sending=true);
    void execute(std::string data,int contentLength);
};

#endif