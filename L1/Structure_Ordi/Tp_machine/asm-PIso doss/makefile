#//////////////////////////////////////////////
#//                                          //
#// This work is licensed under CC BY-SA 4.0 //
#//                                          //
#// Réalisé par Philippe Gilles              //
#// Largement inspiré de la machine de PIso  //
#//                                          //
#//////////////////////////////////////////////

asm-PIso : asm-PIso.o asm-PIso-util.o
	g++ -o asm-PIso asm-PIso.o asm-PIso-util.o

asm-PIso.o : asm-PIso.cpp asm-PIso-util.h
	g++ -c asm-PIso.cpp

asm-PIso-lib.o : asm-PIso-util.cpp asm-PIso-util.h
	g++ -c asm-PIso-util.cpp

clean : 
	rm -f *.o

mrproper : clean
	rm -f asm-PIso
