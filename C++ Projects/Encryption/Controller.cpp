#include "Controller.h"

Controller::Controller(std::string filePath)
{

    std::ifstream infile;
    const char* C = filePath.c_str();
    infile.open(C);


    int pos=-1,num,count=0;
    std::string line,temp,id;
    getline(infile,line);

    pos=line.find(":");
    line.erase(0,pos+1);

    std::stringstream Beako;
    Beako << line;
    Beako >> num;
    Beako.clear();

    numBabushkas=num;

    babushkaArr = new Babushka*[num];
     
    unsigned int value;

    unsigned char** A = new  unsigned char*[numBabushkas];
    while (count<num)
    {
        getline(infile,line);
        pos = line.find(":");
        temp = line.substr(0,pos);

        line.erase(0,pos+1);
        pos = line.find(":");
        if (pos!=-1)
        {
            id = line.substr(0,pos);

            line.erase(0,pos+1);
            //std::cout << "id: " << pos << std::endl;

            A[count]= new unsigned char[pos];
            for (int i = 0; i < pos; i++)
           {
            A[count][i] = id[i];
           }
        }
        else
        {
            A[count]= new unsigned char[line.length()];
            for (int i = 0; i < line.length(); i++)
           {
            A[count][i] = line[i];
            //std::cout << std::endl << A[count][i] << std::endl;
           }
           


        }
        
        
        
         //A =new  reinterpret_cast<const unsigned char > (id.c_str());
        // std::cout << "id: " << A << std::endl;
        // std::cout << "line: " << line << std::endl;
        // std::cout << "count: " << count << std::endl;

        // std::cout << "temp: " << temp << std::endl;

        if (temp=="gold")
        {
          unsigned char B = line[0];
          babushkaArr[count]  =  new GoldBabushka(A[count],B);
        //   std::cout << "Babushka " << babushkaArr[0]->getId()  << std::endl;
        //   std::cout << "Babushka " << count  << std::endl;


        }
        else
        if (temp=="yellow")
        {
        //   std::cout << "Babushka " << babushkaArr[0]->getId()  << std::endl;
        //   std::cout << "Babushka " << count  << std::endl;

          

           babushkaArr[count] = new YellowBabushka(A[count]);
        //   std::cout << "Babushka " << babushkaArr[0]->getId()  << std::endl;
          
        //   std::cout << "Babushka " << babushkaArr[1]->getId()  << std::endl;

        }
        else
        if (temp=="green")
        {
            Beako << line;
            Beako >> value;
            Beako.clear();
            babushkaArr[count] = new GreenBabushka(A[count],value);
        }
        else
        if (temp=="red")
        {
            Beako << line;
            Beako >> value;
            Beako.clear();
            babushkaArr[count] = new RedBabushka(A[count],value);
        }
        else
        if (temp=="lightblue")
        {
            Beako << line;
            Beako >> value;
            Beako.clear();
            babushkaArr[count] = new LightBlueBabushka(A[count],value);
        }
        else
        if (temp=="darkblue")
        {
            Beako << line;
            Beako >> value;
            Beako.clear();
            babushkaArr[count] = new DarkBlueBabushka(A[count],value);
        }



        count++;
    }
    infile.close();

    // for (int i = 0; i < numBabushkas; i++)
    // {
    //     std::cout << "Babushka " << i << " " << babushkaArr[i]->getId() << std::endl;
    // }
    

}

Controller::~Controller()
{
    if (babushkaArr!=NULL)
    {
       for (int i = 0; i < numBabushkas; i++)
       {
           delete babushkaArr[i];
       }
       delete [] babushkaArr;
    }
    
}

ReturnStruct Controller::expandArray(unsigned char* array,int currentSize,const unsigned char* id ,int idSize)
{
    int Goliath,num,num2;
    Goliath=currentSize+2*idSize;
    unsigned char* Kyoko= new unsigned char[Goliath];
    //std::cout << std::endl << "hallo " << idSize << std::endl;

    for (int i = 0; i < idSize; i++)
    {
        Kyoko[i]=id[i];
        num=i+1;  
    }

    for (int a = 0; a < currentSize; a++)
    {
        Kyoko[a+num]=array[a];
        num2=a+1;
        
    }
    delete [] array;

    num2=num2+num;

    for ( int a=0; a < idSize; a++)
    {
        Kyoko[a+num2]=id[a];
    }
    
    ReturnStruct Petelgeuse= {
        Goliath,
        Kyoko
        };

        return Petelgeuse; 
}

ReturnStruct Controller::reduceArray(unsigned char* array,int currentSize,const unsigned char* expectedId ,int idSize)
{

    int Maus;
    Maus=currentSize-2*idSize;
    

    if (Maus<0) throw ControllerException("size exception");

    unsigned char* Kyoko = new unsigned char[Maus];

    for (int i = 0; i < idSize; i++) if (array[i]!=expectedId[i]) throw ControllerException("id mismatch exception");  
    //  std::cout << Maus << std::endl;
    //  std::cout << array[162] << std::endl;



    for (int i = 0; i < idSize; i++) if (array[i+Maus+idSize]!=expectedId[i])
    {
    //    std::cout << i << std::endl;

    //   std::cout << array[i+Maus+idSize] << std::endl;

      throw ControllerException("id mismatch exception");
    }


    for (int i = 0; i < Maus; i++)  Kyoko[i]=array[i+idSize];
    
    
     ReturnStruct Petelguese = {
         Maus,
         Kyoko
     }  ;
    
    delete [] array;
    
    return Petelguese;
}

void Controller::printArray(unsigned char* array,int size)
{


    std::cout << "[";
    for (int i = 0; i < size; i++)
    {
        std::cout << array[i];
        if (i!=size-1) std::cout << ","; // not last element
        else
        std::cout << "]" << std::endl;  // last element
        
    }
    
}

ReturnStruct Controller::encrypt(const unsigned char* array,int size)
{

 try
 {
   
     unsigned char* Kyoko = new unsigned char[size];

    for (int i = 0; i < size; i++)
    {
        Kyoko[i]=array[i];
    }
    printArray(Kyoko,size);

    ReturnStruct Mouse = {
        size,
        Kyoko
    };

    // std::cout << std::endl << Mouse.arraySize << std::endl;
    // for (int i = 0; i < size; i++)
    // {
    //      std::cout << Kyoko[i];
    // }
    // std::cout << std::endl;

    for (int i = 0; i < numBabushkas; i++)
    { 
        Mouse = expandArray(Mouse.returnArray,Mouse.arraySize,babushkaArr[i]->getId(),babushkaArr[i]->getIdLength());
        // if (i==6)
        // {
        //     std::cout << std::endl;
        //     for (int k = 0; k < Mouse.arraySize; k++)
        //     {
        //         std::cout  << Mouse.returnArray[k]  ;
        //     }
        //     std::cout << std::endl;

            
        // }
        
       babushkaArr[i]->encrypt(Mouse.returnArray,Mouse.arraySize);

       printArray(Mouse.returnArray,Mouse.arraySize);
    }

    return Mouse;
    

 }
 catch(BabushkaException& babushkaException)
 {
     throw ControllerException(babushkaException ,"encrypt exception");
 }
 

 
 
    
}

ReturnStruct Controller::decrypt(const unsigned char* array,int size)
{

 try
 {
    unsigned char* Kyoko = new unsigned char[size];

    for (int i = 0; i < size; i++)
    {
        Kyoko[i]=array[i];
    }
    printArray(Kyoko,size);

    ReturnStruct Mouse = {
        size,
        Kyoko
    };
             //std::cout <<"hallo " << std::endl;

    for (int i = numBabushkas-1; i > -1; i--)
    {
        babushkaArr[i]->decrypt(Mouse.returnArray,Mouse.arraySize);

        // if (i==5)
        // {
        //     std::cout << std::endl;
        //     for (int k = 0; k < Mouse.arraySize; k++)
        //     {
        //         std::cout  << Mouse.returnArray[k]  ;
        //     }
        //     // std::cout << std::endl;

        //     // std::cout << babushkaArr[i]->getId()<< std::endl;
        //     // std::cout << babushkaArr[i]->getIdLength()<<std::endl;


        //     std::cout << std::endl;

            
        // }



        Mouse = reduceArray(Mouse.returnArray,Mouse.arraySize,babushkaArr[i]->getId(),babushkaArr[i]->getIdLength());

         printArray(Mouse.returnArray,Mouse.arraySize);

    }

      
    return Mouse;
    
 }
 catch(BabushkaException& babushkaException)
 {
     throw ControllerException(babushkaException ,"decrypt exception");
 }
 
     
    
}