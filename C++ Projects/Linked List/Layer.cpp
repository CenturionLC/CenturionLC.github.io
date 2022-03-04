#include "Layer.h"
#include <string>
#include <iostream>
#include <sstream>

Layer::Layer()
{
    up = NULL;
    down = NULL;
}

 Layer::~Layer()
{
    delete down;
    down = NULL;
}

void Layer::setUp(Layer* up)
{
    this->up = up;
}

void Layer::configure(config settings)
{
    computerName=settings.computerName;
    down->configure(settings);
}

void Layer::link(Layer* linkStack)
{
    down->link(linkStack);
}

Layer* Layer::getDown()
{
    return down;
}