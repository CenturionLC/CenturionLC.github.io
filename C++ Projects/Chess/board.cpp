#include <fstream> 
#include "board.h"

using namespace std;

board::board(string pieceList)
{
    string line,typ,temp;
    string* gekota;
    int pos,X,Y;
   ifstream infile;
   const char* C = pieceList.c_str();  
   numWhitePieces=0;
   numBlackPieces=0;  

   infile.open(C);
   getline(infile,line);
   

   sideToMove = line[0];
   getline(infile,line);
   move = line;          //should look at this later

   string* linesB = new string[16];
   string* linesW = new string[16];

   while (getline(infile,line))
   {
      if (line[0]=='b') // Black piece
      {
          linesB[numBlackPieces]= line;
          numBlackPieces++;
      }  
      else
      {
        linesW[numWhitePieces]= line;  //White piece
        numWhitePieces++;
      }
      
   }
    blackPieces = new piece*[numBlackPieces];
    //cout << numBlackPieces << endl;
    //cout << numWhitePieces << endl;
    whitePieces = new piece*[numWhitePieces];
    

   for (int i = 0; i < numBlackPieces; i++)
   {
       line = linesB[i];
       
       pos=line.find(",");
       line.erase(0,pos+1);

       pos=line.find(",");
       typ=line.substr(0,pos);
       line.erase(0,pos+1);

       pos=line.find(",");
       temp = line.substr(0,pos);
       stringstream beako;
       beako << temp;
       beako >> X;
       beako.clear();

       line.erase(0,pos+1);
       beako << line;
       beako >> Y;
       beako.clear();

      


       blackPieces[i]= new piece(typ,'b',X,Y);
   }

    
   for (int i = 0; i < numWhitePieces; i++)
   {
       line = linesW[i];
       pos=line.find(",");
       //cout << line << endl;
       line.erase(0,pos+1);

       pos=line.find(",");
       typ=line.substr(0,pos);
       line.erase(0,pos+1);

       pos=line.find(",");
       temp = line.substr(0,pos);
       stringstream beako;
       beako << temp;
       beako >> X;
       beako.clear();

       line.erase(0,pos+1);
       beako << line;
       beako >> Y;
       beako.clear();

       //cout <<"x: " << X << endl;
       //cout <<"y: " << Y << endl;

       whitePieces[i]= new piece(typ,'w',X,Y);
   }

   //delete [] linesB;                                            // This might cause problems if stupid
   //delete [] linesW;
  

   chessboard = new string*[8];
   //cout << "test" << endl;
   
   for (int i = 0; i < 8; i++)
   {
       gekota = new string[8];         // may have to delete this
       for (int k = 0; k < 8; k++)
       {
           gekota[k]="-";
           //cout << gekota[k];
       } 
       //cout << endl;
       chessboard[i]=gekota;   
       gekota=NULL;
   }

       
   
   
    for (int i = 0; i < numWhitePieces; i++)            //white board
    {
        X = whitePieces[i]->getX();
        Y = whitePieces[i]->getY();

        // cout << X << endl;
        // cout << Y << endl;
        // cout << whitePieces[i]->getPieceType()[0] << endl;

        
        chessboard[X][Y]="w";
        //Acout << "w" << whitePieces[i]->getPieceType()[0] << endl;
        if (whitePieces[i]->getPieceType()=="king") chessboard[X][Y]=chessboard[X][Y]+"K";
        else
        chessboard[X][Y]=chessboard[X][Y]+whitePieces[i]->getPieceType()[0];
        //cout <<chessboard[X][Y] << endl;
        
    }
    //cout <<"w" <<endl;
    //cout << whitePieces[0]->getPieceType()[0] << endl;
    //cout <<"w" + whitePieces[0]->getPieceType()[0] << endl;
    
    
    for (int i = 0; i < numBlackPieces; i++)            //black board
    {
        X = blackPieces[i]->getX();
        Y = blackPieces[i]->getY();

        chessboard[X][Y]="b";
        if (blackPieces[i]->getPieceType()=="king") chessboard[X][Y]=chessboard[X][Y]+"K";
        else
        chessboard[X][Y]=chessboard[X][Y]+blackPieces[i]->getPieceType()[0];
    }

    //  for (int i = 0; i < 8; i++)
    //     {
    //         for (int k = 0; k < 8; k++)
    //         {
    //             cout << chessboard[i][k];
    //         }
    //         cout << endl;
            
    //     }
   

   infile.close();

}

board::~board()
{
    if (blackPieces!=NULL)
    {
        for (int i = 0; i < numBlackPieces; i++)
    {
         blackPieces[i]->~piece();              //call if destructor is oof
    }
    delete [] blackPieces;
    blackPieces=NULL;

    }
    
    
  if (whitePieces!=NULL)
  {
      for (int i = 0; i < numWhitePieces; i++)
    {
         whitePieces[i]->~piece();              //call if destructor is oof
    }
    delete [] whitePieces;
    whitePieces=NULL;
  }
  
    
    if (chessboard!=NULL)
    {
        for (int i = 0; i < 8; i++)
    {
        delete [] chessboard[i];
    }
    delete [] chessboard;
    chessboard=NULL;
    }
    
    
    

    cout << "Num Pieces Removed: " << numBlackPieces+numWhitePieces << endl;     // num originally placed on board :/
}

board& board::operator++()   // move piece
{

    string line,temp;
    int pos,X,Y,A,B;
    line=move;
    pos = line.find(",");
    temp = line.substr(0,pos);
    line.erase(0,pos+1);

    stringstream beako;
    beako << temp;
    beako >> X;
    beako.clear();

    pos = line.find(",");
    temp = line.substr(0,pos);
    line.erase(0,pos+1);

    beako << temp;
    beako >> Y;
    beako.clear();

    pos = line.find(",");
    temp = line.substr(0,pos);
    line.erase(0,pos+1);


    beako << temp;
    beako >> A;
    beako.clear();

    beako << line;
    beako >> B;

            
    chessboard[A][B]=chessboard[X][Y];   //go check for more swaps of x and y index
    chessboard[X][Y]="-" ;

    for (int i = 0; i < numWhitePieces; i++)
    {

       // if ((whitePieces[i]->getX()==A) && (whitePieces[i]->getY()==B)) whitePieces[i]->~piece();  // delete piece if taken   // Pieces wont be taken!
            
        if ((whitePieces[i]->getX()==X) && (whitePieces[i]->getY()==Y))
        {
            whitePieces[i]->setX(A);
            whitePieces[i]->setY(B);
        }    
    }

    for (int i = 0; i < numBlackPieces; i++)
    {

       // if ((blackPieces[i]->getX()==A) && (blackPieces[i]->getY()==B)) blackPieces[i]->~piece();  // delete piece if taken
        
        if ((blackPieces[i]->getX()==X) && (blackPieces[i]->getY()==Y))
        {
            blackPieces[i]->setX(A);
            blackPieces[i]->setY(B);
        }   
    }


    // for (int i = 0; i < 8; i++)
    //     {
    //         for (int k = 0; k < 8; k++)
    //         {
    //             cout << chessboard[i][k];
    //         }
    //         cout << endl;
            
    //     }
    return *this;

     
}

bool board::checkIfPieceHasCheck(string pieceType,int xPos,int yPos,int kingX,int  kingY)       
{

//    Philip sent a message to the Spartans saying “If I invade Lakonia you will be destroyed, never to rise again.”
//    The Spartans replied with one word, “If.”

    int distance,num1,num2;

    

    // if (xPos==kingX && yPos == kingY && pieceType!="king") return true;
    
    
    // check if king blocks

    

    //   cout <<"Piece: " <<pieceType << endl;
    //  cout <<"Pos: "<<xPos << endl;
    // cout <<"King: " << kingX << " " << kingY << endl;

    if (pieceType=="king" && !(kingX==xPos && kingY==yPos))    // King function
    {
        for (int i = -1; i < 2; i++)
        {
           for (int k = -1; k < 2; k++)
           {
               if (xPos+i==kingX && yPos+k==kingY) return true;                                               
           }
           
        }
        
    }
    

    if (pieceType=="rook")   
    {
        // cout << "--------------" << endl;
        // cout << "xpos: " << xPos << endl;
        // cout << "ypos: " << yPos << endl;

        // cout << "kingX: " << kingX << endl;
        // cout << "kingY: " << kingY << endl;
        int flag=false;



        if (kingX==xPos)
        {
           if(kingY-yPos==1 || yPos-kingY==1)  return true;

        //    if (kingY>yPos) for (int i = 1; i < kingY-yPos; i++) if (chessboard[xPos][yPos+i]!="-" ) return false;
           if (kingY>yPos ) for (int i = 1; i < kingY-yPos; i++)
           {
               if (chessboard[xPos][yPos+i][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+a==kingX && yPos+b+i) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos][yPos+i]!="-" && flag==false) return false;
           }

        //    if (kingY<yPos) for (int i = 1;i<yPos-kingY;i++) if (chessboard[xPos][kingY+i]!="-") return false;  
           if (kingY<yPos ) for (int i = 1; i < yPos-kingY; i++)
           {
               if (chessboard[xPos][kingY+i][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+a==kingX && yPos+b+i) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos][kingY+i]!="-" && flag==false) return false;
           }    

           return true;       
        }

        if (kingY==yPos)
        {
            // cout << "kyoko" << endl;
           if(kingX-xPos==1 || xPos-kingX==1)  return true;
        //    cout << "tungsten rat"<< endl;


           if (kingX>xPos ) for (int i = 1; i < kingX-xPos; i++)
           {
               if (chessboard[xPos+i][yPos][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+i+a==kingX && yPos+b) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos+i][yPos]!="-" && flag==false) return false;
           }
           
            


           if (kingX<xPos) for (int i = 1; i < xPos-kingX; i++)
           {
               if (chessboard[kingX+i][yPos][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+i+a==kingX && yPos+b) flag=true;                    
                   }
                  
               }

               if (chessboard[kingX+i][yPos]!="-" && flag==false) return false;
           }      

           return true;       
        }

        //cout << "Tungsten Rat" << endl;
    }
       
     
    
    //cout << "Yeet" << endl;

    if (pieceType=="knight")
    {
        if (yPos==kingY+2) if (xPos-1==kingX || xPos+1==kingX) return true;    
        if (yPos==kingY+1) if (xPos-2==kingX || xPos+2==kingX) return true;
        if (yPos==kingY-1) if (xPos-2==kingX || xPos+2==kingX) return true;    
        if (yPos==kingY-2) if (xPos-1==kingX || xPos+1==kingX) return true;
    }

    if (pieceType=="bishop")    
    {
        int flag=false;

        // cout << "--------------" << endl;
        // cout << "xpos: " << xPos << endl;
        // cout << "ypos: " << yPos << endl;

        // cout << "kingX: " << kingX << endl;
        // cout << "kingY: " << kingY << endl;
        for (int i=1;i<8-yPos;i++) if (xPos+i==kingX && yPos+i==kingY) 
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {
                       if (chessboard[xPos+a][yPos+a][1]=='K')
                         {
                           for (int b = -1; b < 2; b++) 
                           for (int c = -1;c < 2; c++)
                         {
                             if (xPos+b+a==kingX && yPos+c+a) flag=true;                    
                         }
                  
               }
                       //cout << a << endl;
                       if (chessboard[xPos+a][yPos+a]!="-" && flag==false) return false;
                       
                   }                                      
            return true;
          }
        
        for (int i=1;i<8-yPos;i++) if (xPos-i==kingX && yPos+i==kingY) 
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               


                   for (int a = 1; a < i ; a++)
                   {
                       if (chessboard[xPos-a][yPos+a][1]=='K')
                         {
                           for (int b = -1; b < 2; b++) 
                           for (int c = -1;c < 2; c++)
                          {
                           if (xPos+b-a==kingX && yPos+c+i) flag=true;                    
                          }
                  
                    }
                       //cout << a << endl;
                       if (chessboard[xPos-a][yPos+a]!="-" && flag==false)  return false;
                       
                       
                   }                                      
            return true;
          }
            //   cout << "unity!" << endl;
            //   cout <<"xPos: " << xPos << endl;
            //   cout <<"yPos: " << yPos << endl;



        for (int i=1;i<8-xPos;i++) if (xPos+i==kingX && yPos-i==kingY) //gud
          {
               distance = i;
            //    cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {

                       if (chessboard[xPos+a][yPos-a][1]=='K')
                        {
                         for (int b = -1; b < 2; b++) 
                         for (int c = -1;c < 2; c++)
                             {
                              if (xPos+b+a==kingX && yPos+c-a) flag=true;                    
                             }
                         
                     }
                       //cout << a << endl;
                       if (chessboard[xPos+a][yPos-a]!="-" && flag==false) return false;
                        
                       
                   }                                      
            return true;
          }
        for (int i=1;i<xPos+1;i++) if (xPos-i==kingX && yPos-i==kingY) //gud
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {

                       if (chessboard[xPos-a][yPos-a][1]=='K')
                     {
                         for (int b = -1; b < 2; b++) 
                         for (int c = -1;c < 2; c++)
                         {
                             if (xPos-a-b==kingX && yPos-a-c) flag=true;                    
                         }
                  
                     }
                       //cout << a << endl;
                       if (chessboard[xPos-a][yPos-a]!="-" && flag==false) return false;
                       
                       
                   }                                      
            return true;
          }
    }    
    
    
    if (pieceType=="queen")             // time to simp for my queen :/
    {
        //ctrl c +ctrl v of rook
       if (1==1)    // just to hide code
       {
       
        int flag=false;



        if (kingX==xPos)
        {
           if(kingY-yPos==1 || yPos-kingY==1)  return true;

        //    if (kingY>yPos) for (int i = 1; i < kingY-yPos; i++) if (chessboard[xPos][yPos+i]!="-" ) return false;
           if (kingY>yPos ) for (int i = 1; i < kingY-yPos; i++)
           {
               if (chessboard[xPos][yPos+i][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+a==kingX && yPos+b+i) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos][yPos+i]!="-" && flag==false) return false;
           }

        //    if (kingY<yPos) for (int i = 1;i<yPos-kingY;i++) if (chessboard[xPos][kingY+i]!="-") return false;  
           if (kingY<yPos ) for (int i = 1; i < yPos-kingY; i++)
           {
               if (chessboard[xPos][kingY+i][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+a==kingX && yPos+b+i) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos][kingY+i]!="-" && flag==false) return false;
           }    

           return true;       
        }

        if (kingY==yPos)
        {

            // cout << "kyoko" << endl;
           if(kingX-xPos==1 || xPos-kingX==1)  return true;
        //    cout << "tungsten rat"<< endl;


           if (kingX>xPos ) for (int i = 1; i < kingX-xPos; i++)
           {
               if (chessboard[xPos+i][yPos][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+i+a==kingX && yPos+b) flag=true;                    
                   }
                  
               }

               if (chessboard[xPos+i][yPos]!="-" && flag==false) return false;
           }
           
            

           if (kingX<xPos) for (int i = 1; i < xPos-kingX; i++)
           {
               if (chessboard[kingX+i][yPos][1]=='K')
               {
                   for (int a = -1; a < 2; a++) 
                   for (int b = -1;b < 2; b++)
                   {
                       if (xPos+i+a==kingX && yPos+b) flag=true;                    
                   }
                  
               }

               if (chessboard[kingX+i][yPos]!="-" && flag==false) return false;
           }      

           return true;       
        }
       }
        

        //ctrl c +ctrl v of bishop
        if (1==1) 
        {   // just to hide code
         int flag=false;

        // cout << "--------------" << endl;
        // cout << "xpos: " << xPos << endl;
        // cout << "ypos: " << yPos << endl;

        // cout << "kingX: " << kingX << endl;
        // cout << "kingY: " << kingY << endl;
        for (int i=1;i<8-yPos;i++) if (xPos+i==kingX && yPos+i==kingY) 
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {
                       if (chessboard[xPos+a][yPos+a][1]=='K')
                         {
                           for (int b = -1; b < 2; b++) 
                           for (int c = -1;c < 2; c++)
                         {
                             if (xPos+b+a==kingX && yPos+c+a) flag=true;                    
                         }
                  
               }
                       //cout << a << endl;
                       if (chessboard[xPos+a][yPos+a]!="-" && flag==false) return false;
                       
                   }                                      
            return true;
          }
        
        for (int i=1;i<8-yPos;i++) if (xPos-i==kingX && yPos+i==kingY) 
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               


                   for (int a = 1; a < i ; a++)
                   {
                       if (chessboard[xPos-a][yPos+a][1]=='K')
                         {
                           for (int b = -1; b < 2; b++) 
                           for (int c = -1;c < 2; c++)
                          {
                           if (xPos+b-a==kingX && yPos+c+i) flag=true;                    
                          }
                  
                    }
                       //cout << a << endl;
                       if (chessboard[xPos-a][yPos+a]!="-" && flag==false)  return false;
                       
                       
                   }                                      
            return true;
          }
            //   cout << "unity!" << endl;
            //   cout <<"xPos: " << xPos << endl;
            //   cout <<"yPos: " << yPos << endl;



        for (int i=1;i<8-xPos;i++) if (xPos+i==kingX && yPos-i==kingY) //gud
          {
               distance = i;
            //    cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {

                       if (chessboard[xPos+a][yPos-a][1]=='K')
                        {
                         for (int b = -1; b < 2; b++) 
                         for (int c = -1;c < 2; c++)
                             {
                              if (xPos+b+a==kingX && yPos+c-a) flag=true;                    
                             }
                         
                     }
                       //cout << a << endl;
                       if (chessboard[xPos+a][yPos-a]!="-" && flag==false) return false;
                        
                       
                   }                                      
            return true;
          }
        for (int i=1;i<xPos+1;i++) if (xPos-i==kingX && yPos-i==kingY) //gud
          {
               distance = i;
               //cout << "distance: "<<distance << endl;
               
                   for (int a = 1; a < i ; a++)
                   {

                       if (chessboard[xPos-a][yPos-a][1]=='K')
                     {
                         for (int b = -1; b < 2; b++) 
                         for (int c = -1;c < 2; c++)
                         {
                             if (xPos-a-b==kingX && yPos-a-c) flag=true;                    
                         }
                  
                     }
                       //cout << a << endl;
                       if (chessboard[xPos-a][yPos-a]!="-" && flag==false) return false;
                       
                       
                   }                                      
            return true;
          }
    }
 }

    if (pieceType=="pawn")
    {
        if (sideToMove=='b') if (xPos==kingX+1) if (yPos==kingY-1 || yPos==kingY+1) return true;   //king must be below
        if (sideToMove=='w') if (xPos==kingX-1) if (yPos==kingY-1 || yPos==kingY+1) return true;   //king must be above
    }
    
    return false;    //   y u own king
    
}


// invisible pawn
//create for king function
board& board::operator--()
{
    //  for (int i = 0; i < 8; i++)
    //     {
    //         for (int k = 0; k < 8; k++)
    //         {
    //             cout << chessboard[i][k];
    //         }
    //         cout << endl;
            
    //     }

    ++*this;
    // cout << "########" << endl;

    //  for (int i = 0; i < 8; i++)
    //     {
    //         for (int k = 0; k < 8; k++)
    //         {
    //             cout << chessboard[i][k];
    //         }
    //         cout << endl;
            
    //     }
    int A,B;
    bool flag=false;
    //cout << sideToMove << endl;
    if (sideToMove=='w')
    {
        for (int i = 0; i < numBlackPieces; i++)
        {
           if  (blackPieces[i]->getPieceType()=="king")
           {
                A = blackPieces[i]->getX();
                B = blackPieces[i]->getY();
           }
        } 
         
    }
    else
    {
        for (int i = 0; i < numWhitePieces; i++)
        {
           if  (whitePieces[i]->getPieceType()=="king")
           {
                A = whitePieces[i]->getX();
                B = whitePieces[i]->getY();
           }
        }

    }
    
                // they dont need to know
    if (sideToMove=='w')
           // This is absolutely disgusting tbh 

    {
     for (int i = 0; i < numWhitePieces; i++)
      if (checkIfPieceHasCheck(whitePieces[i]->getPieceType(),whitePieces[i]->getX(),whitePieces[i]->getY(),A,B))    //is king checked?
     {    
            if (A+1<8) 
            {
                //  cout << "ano" << endl;

                for (int a = 0; a < numWhitePieces; a++)  
                if (checkIfPieceHasCheck(whitePieces[a]->getPieceType(),whitePieces[a]->getX(),whitePieces[a]->getY(),A+1,B)|| chessboard[A+1][B]!="-" ) 
                //  cout << "bruh" << endl;
                if (B+1<8)
                {
                    // cout << A << endl;
                    // cout << B << endl;

                    for (int b = 0; b < numWhitePieces; b++) 
                    if (checkIfPieceHasCheck(whitePieces[b]->getPieceType(),whitePieces[b]->getX(),whitePieces[b]->getY(),A+1,B+1)|| chessboard[A+1][B+1]!="-" )

                    if (B-1>0) 
                    {
                     for (int c = 0; c < numWhitePieces; c++) 
                     if(checkIfPieceHasCheck(whitePieces[c]->getPieceType(),whitePieces[c]->getX(),whitePieces[c]->getY(),A+1,B-1)|| chessboard[A+1][B-1]!="-" ) flag=true;
                    }
                    else flag=true;
                }  
                else if (B-1>0)
                {
                    for (int b = 0; b < numWhitePieces; b++)  if 
                    (checkIfPieceHasCheck(whitePieces[b]->getPieceType(),whitePieces[b]->getX(),whitePieces[b]->getY(),A+1,B-1)|| chessboard[A+1][B-1]!="-" ) flag=true;
                } 
                else flag=true;

            }
            else flag=true;   // No space to right
             //cout << flag << endl;
             
            if (flag==true)
            {
                flag=false;     //reset
                // cout << "wtf" << endl;

                if (B+1<8)
                {
                   for (int a = 0; a < numWhitePieces; a++)
                   if (checkIfPieceHasCheck(whitePieces[a]->getPieceType(),whitePieces[a]->getX(),whitePieces[a]->getY(),A,B+1)|| chessboard[A][B+1]!="-") 
                   if (B-1>0)
                   {
                       for (int b = 0; b < numWhitePieces; b++)  if 
                       (checkIfPieceHasCheck(whitePieces[b]->getPieceType(),whitePieces[b]->getX(),whitePieces[b]->getY(),A,B-1)|| chessboard[A][B-1]!="-") flag=true;
                   } 
                   else flag=true;  //No space below
                }
                else // No space above
                if (B-1>0) 
                   {
                       for (int a = 0; a < numWhitePieces; a++)  if 
                       (checkIfPieceHasCheck(whitePieces[a]->getPieceType(),whitePieces[a]->getX(),whitePieces[a]->getY(),A,B-1)|| chessboard[A][B-1]!="-") flag=true;
                   } 
                   else flag=true;  // NO space below
                
            }
            // cout << flag << endl;
            if (flag==true)
            {
                flag=false;  //reset
                

                if (A-1>0) 
             {
                for (int a = 0; a < numWhitePieces; a++)  if 
                (checkIfPieceHasCheck(whitePieces[a]->getPieceType(),whitePieces[a]->getX(),whitePieces[a]->getY(),A-1,B)|| chessboard[A-1][B]!="-") 
                if (B+1<8)
                {
                    for (int b = 0; b < numWhitePieces; b++)  if 
                    (checkIfPieceHasCheck(whitePieces[b]->getPieceType(),whitePieces[b]->getX(),whitePieces[b]->getY(),A-1,B+1)|| chessboard[A-1][B+1]!="-")
                    if (B-1>0) 
                    {
                        for (int c = 0; c < numWhitePieces; c++)  if 
                        (checkIfPieceHasCheck(whitePieces[c]->getPieceType(),whitePieces[c]->getX(),whitePieces[c]->getY(),A-1,B-1)|| chessboard[A-1][B-1]!="-") flag=true;
                    }
                    else flag=true;
                }  
                else if (B-1>0)
                {
                    for (int b = 0; b < numWhitePieces; b++)  if 
                    (checkIfPieceHasCheck(whitePieces[b]->getPieceType(),whitePieces[b]->getX(),whitePieces[b]->getY(),A-1,B-1)|| chessboard[A-1][B-1]!="-") flag=true;
                } 
                else flag=true;

             }
             else flag=true;   // No space to left
            }

           
     } 
        // cout << flag << endl;
        if (flag) cout << "Success: Checkmate of " << "b King at [" <<A <<","<< B << "]" << endl;      
            
        else  cout <<"Failed: No Checkmate of b King" << endl;
   }

    
    else
    {

        for (int i = 0; i < numBlackPieces; i++) if
         (checkIfPieceHasCheck(blackPieces[i]->getPieceType(),blackPieces[i]->getX(),blackPieces[i]->getY(),A,B)) 
          // cout << "ano" << endl;
        {   //is king checked?
         
        
        
            
            if (A+1<8) 
            {
                for (int a = 0; a < numBlackPieces; a++)  if 
                (checkIfPieceHasCheck(blackPieces[a]->getPieceType(),blackPieces[a]->getX(),blackPieces[a]->getY(),A+1,B)|| chessboard[A+1][B]!="-") 
                if (B+1<8)
                {
                    for (int b = 0; b < numBlackPieces; b++)  if 
                    (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A+1,B+1)|| chessboard[A+1][B+1]!="-")
                    if (B-1>0) 
                    {
                     for (int c = 0; c < numBlackPieces; c++)  if 
                     (checkIfPieceHasCheck(blackPieces[c]->getPieceType(),blackPieces[c]->getX(),blackPieces[c]->getY(),A+1,B-1)|| chessboard[A+1][B-1]!="-") flag=true;
                    }
                    else flag=true;
                }  
                else if (B-1>0)
                {
                    for (int b = 0; b < numBlackPieces; b++)  if 
                    (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A+1,B-1)|| chessboard[A+1][B-1]!="-") flag=true;
                } 
                else flag=true;

            }
            else flag=true;   // No space to right
            //  cout << flag << endl;
             
            if (flag==true)
            {
                flag=false;     //reset
                // cout << "B: " << B << endl;

                if (B+1<8)
                {
                    
                   for (int a = 0; a < numBlackPieces; a++)  if 
                   (checkIfPieceHasCheck(blackPieces[a]->getPieceType(),blackPieces[a]->getX(),blackPieces[a]->getY(),A,B+1)|| chessboard[A][B+1]!="-") 
                   if (B-1>0)
                   {
                    //    cout << "AAAAAAAAAAAA" << endl;
                       for (int b = 0; b < numBlackPieces; b++)  if 
                       (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A,B-1)|| chessboard[A][B-1]!="-") flag=true;
                   } 
                   else flag=true;  //No space below
                }
                else // No space above
                if (B-1>0) 
                   {
                       for (int b = 0; b < numBlackPieces; b++)  if 
                       (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A,B-1)|| chessboard[A][B-1]!="-") flag=true;
                   } 
                   else flag=true;  // NO space below
                
            }
            //  cout << flag << endl;

            if (flag==true)
            {
                flag=false;  //reset

                if (A-1>0) 
             {
                for (int a = 0; a < numBlackPieces; a++)  if 
                (checkIfPieceHasCheck(blackPieces[a]->getPieceType(),blackPieces[a]->getX(),blackPieces[a]->getY(),A-1,B)|| chessboard[A-1][B]!="-") 
                if (B+1<8)
                {
                    for (int b = 0; b < numBlackPieces; b++)  if 
                    (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A-1,B+1)|| chessboard[A-1][B+1]!="-")
                    if (B-1>0) 
                    {
                        for (int c = 0; c < numBlackPieces; c++)  if 
                        (checkIfPieceHasCheck(blackPieces[c]->getPieceType(),blackPieces[c]->getX(),blackPieces[c]->getY(),A-1,B-1)|| chessboard[A-1][B-1]!="-") flag=true;
                    }
                    else flag=true;
                }  
                else if (B-1>0)
                {
                    for (int b = 0; b < numBlackPieces; b++)  if 
                    (checkIfPieceHasCheck(blackPieces[b]->getPieceType(),blackPieces[b]->getX(),blackPieces[b]->getY(),A-1,B-1)|| chessboard[A-1][B-1]!="-") flag=true;
                } 
                else flag=true;

             }
            else flag=true;   // No space to left
            }
            // cout << flag << endl;

        
        
     }

     if (flag) cout << "Success: Checkmate of " << "w King at [" <<A <<","<< B << "]" << endl;
            
             else  cout <<"Failed: No Checkmate of w King" << endl;
    }
    
    

    return *this;
}