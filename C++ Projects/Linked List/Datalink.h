#ifndef DATALINK_H
#define DATALINK_H
#include "Layer.h"
#include "Physical.h"


class Datalink: public Layer
{
    public:
    Datalink();
    void execute(Message* message,bool sending=true);
};
#endif