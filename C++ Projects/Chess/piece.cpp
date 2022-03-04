#include <string>
#include <iostream>
#include <sstream>
#include "piece.h"

using namespace std;

piece::piece()
{
    //do nothing
}

piece::piece(piece* newPiece)
{
    xPos = newPiece->xPos;
    yPos = newPiece->yPos;
    side = newPiece->side;
    pieceType = newPiece->pieceType;
}

piece::piece(string pType,char side,int x, int y)
{
    xPos = x;
    yPos = y;
    pieceType = pType;
    this->side = side;
}

piece::~piece()             // Go and check for any memory
{
    cout << "(" << xPos << "," << yPos << ") " << side << " " << pieceType << " deleted" << endl;
}

char piece::getSide()
{
    return side;
}

string piece::getPieceType()
{
    return pieceType;
}

int piece::getX()
{
    return xPos;
}

int piece::getY()
{
    return yPos;
}

void piece::setX(int x)
{
    xPos = x;
}

void piece::setY(int y)
{
    yPos = y;
}

void piece::operator[](int pos)
{
    if (pos!=0 && pos!=1)
    {
       cout <<"Invalid Index" << endl;
    }
    else
    {
        if (pos==0)
        {
            cout << "x coord: " << xPos << endl;
        }

        if (pos==1)
        {
           cout << "y coord: " << yPos << endl;
        }
        
        
    }

}

piece& piece::operator+(string move)
{
    int posx,posy,pos;  
    string line;            // what if values are >1 digit?
    stringstream beako;

    pos = move.find(",");
    line =  move.substr(0,pos);
   // cout << line << endl;
    beako << line;
    beako >> posx;
    beako.clear();

    move.erase(0,pos+1);
    //cout << move << endl;


    beako << move;
    beako >> posy;

    //cout << posx << endl;
    //cout << posy << endl;

    if ((posx<0 || posx>7) || (posy<0 || posy>7) )
    {
        //do nothing since something is invalid
        return *this;
    }
    else
    {
        this->xPos = posx;
        this->yPos = posy;
        return *this;
    }
    

}


ostream& operator<<(ostream& output,const piece& t)
{
    output<<  t.side <<" " << t.pieceType << " at [" <<t.xPos << "," << t.yPos << "]" << endl;

    return output;
}