all: generate run

generate:
	g++ -c -std=c++98 Babushka.cpp BlueBabushka.cpp Controller.cpp DarkBlueBabushka.cpp LightBlueBabushka.cpp ControllerException.cpp DisplacementException.cpp GoldBabushka.cpp GreenBabushka.cpp OverflowException.cpp UnderflowException.cpp YellowBabushka.cpp RotateException.cpp RedBabushka.cpp main.cpp

	g++ -o main Babushka.o BlueBabushka.o Controller.o DarkBlueBabushka.o LightBlueBabushka.o ControllerException.o DisplacementException.o GoldBabushka.o GreenBabushka.o OverflowException.o UnderflowException.o YellowBabushka.o RotateException.o RedBabushka.o main.o
run:
	./main  

clean:
	rm *.o main