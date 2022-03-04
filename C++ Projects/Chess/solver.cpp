#include "solver.h"

solver::solver(string games)
{
    ifstream infile;
    string line,temp;
    int pos,count=0,num,lowest=999999,index=0;
    numGames=0;

    const char* C = games.c_str();
    infile.open(C);
    

    while (getline(infile,line)) numGames++;
    
     infile.close();
     infile.open (C);

    boards = new board*[numGames];
    int* priority=new int[numGames];                // may need to delete

    while (getline(infile,line))
    {
        pos = line.find(",");
        temp = line.substr(0,pos);
        boards[count]=new board(temp);
        line.erase(0,pos+1);

        stringstream beako;
        beako << line;
        beako >> num;

        priority[count] = num;
        count ++;
    }

    

    
    
    
    for (int k = 0; k < numGames; k++)
    {
        lowest=99999;
        for (int i = 0; i < numGames; i++)
         {
             //cout <<"prior: " <<priority[i] << endl;
            if (priority[i]<lowest)
             {
                
               lowest=priority[i];
               index=i;
             }
             
             
           // cout << "lowest: " << lowest << endl;
         }
         //cout <<"numGames: " <<  numGames << endl;

        // for (int i = 0; i < numGames; i++)
        //    {
        //      cout << priority[i] << endl;
        //    }
        //    cout << "------------" << endl;

        //  cout << lowest << endl;
        //  cout << priority[lowest] << endl;
        //cout << index << endl;
        
        

        cout << "[" << priority[index] << "] ";
        boards[index]->operator--();
        //cout << boards[index]->checkIfPieceHasCheck("rook",0,6,0,2) << endl;
        priority[index]=99999;

        //cout <<  "#########" << endl;
        

    } 
    
}


solver::~solver()
{
    if (boards!=NULL)
    {
        for (int i = 0; i < numGames; i++)
        {
            boards[i]->~board();
        }
        delete [] boards;
        boards=NULL;
    }

    cout << "Num Boards Deleted: " << numGames << endl;
    
}