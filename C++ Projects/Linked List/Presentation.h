#ifndef PRESENTATION_H
#define PRESENTATION_H
#include "Layer.h"
#include "Transport.h"

class Presentation : public Layer 
{
    private:
    std::string encoding;
    public:
    Presentation();
    void execute(Message* message,bool sending=true);
    void configure(config settings);
};
#endif