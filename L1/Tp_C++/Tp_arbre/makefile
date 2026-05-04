SRC =	*.cpp

FLAGS = -Wall \
		-Wextra \
		-Werror \

FLAGS2 = -std=c++11 \
	   -lncurses \
	   -o \

all :
	g++ $(SRC) $(FLAGS2) tp && \
	clear && \
	./tp

clean :
	rm -f text.txt tp output.txt && \
	clear