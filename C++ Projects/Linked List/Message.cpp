#include "Message.h"
#include <string>
#include <iostream>
#include <sstream>


using namespace std;


Message::Message(string Messagedata)
{
    contentLength = Messagedata.length();
    Encoding = "";
    data = Messagedata;

    Destination = "";
    Origin = "";
}

Message::Message(Message* msg)
{
    data = msg->data;
}

string Message::getData()
{
    return data;
}



string Message::getDestination()
{
    string error;
    error  = "ERROR: INCOMPLETE ADDRESS";

    if (Destination=="") return error;
    

    int pos = 0,num;
    string line = Destination;


    for (int i = 0; i < 4; i++)
    {
       if (i!=3)
       {
           pos = line.find(".");
       }
       else 
       {
          pos=0;
          pos = line.find(":");
       }
         if (pos==-1)  return error;
         line.erase(0,pos+1);
         //if (line.substr(0,pos)=="") return error;
    }
    if (line=="") return error;


    
    return Destination;
}

string Message::getOrigin()
{
    string error;
    error  = "ERROR: INCOMPLETE ADDRESS";

    int pos = 0,num;
    string line = Origin;
    if (Origin=="") return error;


    for (int i = 0; i < 4; i++)
    {
       if (i!=3)
       {
           pos = line.find(".");
       }
       else 
       {
          pos=0;
          pos = line.find(":");
       }
         if (pos==-1)  return error;
         line.erase(0,pos+1);

         //if (line.substr(0,pos)=="") return error;
    }
    if (line=="") return error;
    
    return Origin;
}

string Message::getEncoding()    // do something?
{
    return Encoding;
}

string Message::getDestinationIP()
{
    if (Destination=="") return "ERROR: IPV4 NOT SET";

    int pos = Destination.find(":");
    
    if (pos==-1) return Destination;
    else
    {
      string san = Destination.substr(0,pos);
      if (san=="") return "ERROR: IPV4 NOT SET"; 
      else 
      return san;
    }
}


string Message::getDestinationPort()
{
    string error = "ERROR: PORT NOT SET";
    if (Destination=="") return error;

    //cout << "Destiny!!!: " << Destination << endl;
    
    

    int pos = Destination.find(":");
    if (pos==-1) return error;
    
    
    string line = Destination;
    line.erase(0,pos+1);
    //cout << "EMilia Tan!: " << line << endl;
    return line;
}

string Message::getOriginIP()
{
    //cout << "Origin: " << Origin << endl;
    if (Origin=="") return "ERROR: IPV4 NOT SET";

    int pos = Origin.find(":");
    
    if (pos==-1) return Origin;
    else
    {
      string san = Origin.substr(0,pos);
      if (san=="") return "ERROR: IPV4 NOT SET"; 
      else 
      return san;
      
    } 
}

string Message::getOriginPort()
{
    string error = "ERROR: PORT NOT SET";
    if (Origin=="") return error;
    
    

    int pos = Origin.find(":");
    if (pos==-1) return error;
    
    
    string line = Origin;
    line.erase(0,pos+1);
    return line;
}

bool Message::setDestinationIP(string DestIP)
{
    //cout << "Dest: " <<Destination << endl;
    if (getDestinationIP()!="ERROR: IPV4 NOT SET") return false;
    //cout << getDestinationIP() << endl;

    
    stringstream Beako;
    string line = DestIP;
    int pos=0,num;
    

    for (int i = 0; i < 3; i++)
    {
        pos = line.find(".");
        if (pos==-1) return false;
        
        Beako << line.substr(0,pos) ;
        Beako >> num;

        if (!Beako || num<0 || num > 255) return false;

        line.erase(0,pos+1);
        Beako.clear();
    }

    

    Beako << line;
    Beako >> num;
    
    if (!Beako || num<0 || num > 255) return false;

    

    if (Destination.find(":")!=-1)
    {
        Destination = DestIP+ Destination;
        return true;
    }
    
    Destination = DestIP;
    return true;
}

bool Message::setDestinationPort(string DestPort)
{
    int num;
    stringstream Beako;
    Beako << DestPort;
    Beako >> num;


    // cout << num << endl;


    // cout << "Destination: " <<Destination << endl;
    // cout << "number: " << num << endl;

    if (!Beako || num > 65535 || num < 0)  return false;
    
    if (Destination.find(":")!=-1) return false;
    
    Destination = Destination + ":" + DestPort;

   //  cout << "Destination: " <<Destination << endl;


    return true;
}

bool Message::setOriginIP(string OriginIP)
{

    if (getOriginIP()!="ERROR: IPV4 NOT SET") return false;
    
    stringstream Beako;
    string line = OriginIP;
    int pos=0,num;

    for (int i = 0; i < 3; i++)
    {
        pos = line.find(".");
        if (pos==-1) return false;
        
        Beako << line.substr(0,pos) ;
        Beako >> num;

        if (!Beako || num<0 || num > 255) return false;

        line.erase(0,pos+1);
        Beako.clear();
    }

    Beako << line;
    Beako >> num;
    
    if (!Beako || num<0 || num > 255) return false;

    if (Origin.find(":")!=-1)
    {
        Origin = OriginIP+ Origin;
        return true;
    }

    Origin = OriginIP;
    return true;
}

bool Message::setOriginPort(string OriginPort)
{
    int num;
    stringstream Beako;
    Beako << OriginPort;
    Beako >> num;

    if (!Beako || num > 65535 || num < 0)  return false;
    
    if (Origin.find(":")!=-1) return false;
    
    Origin = Origin + ":" + OriginPort;

    return true;
}

void Message::setEncoding(string Encoding)
{
    this->Encoding = Encoding;
}

void Message::PrintMessage()
{
    cout << "Data: " << data << endl;
    cout << "Destination: " << getDestination() << endl;
    cout << "Destination IPV4: " << getDestinationIP() << endl;
    cout << "Destination Port: "<< getDestinationPort() << endl;
    cout << "Origin: " << getOrigin() << endl;
    cout << "Origin IPV4: " << getOriginIP() << endl;
    cout << "Origin Port: "<< getOriginPort() << endl;
    cout << "Encoding: " << getEncoding() << endl;
}

Message::~Message()
{
    cout << "Deleted message containing: " << data << endl;
}

int Message::getContentLength()
{
    return contentLength;
}

void Message::setContentLength(int contentLength)
{
    this->contentLength = contentLength;
}