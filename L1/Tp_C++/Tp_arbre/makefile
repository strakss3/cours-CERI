SRC =	*.cpp

FLAGS = -Wall \
		-Wextra \
		-Werror \

TRUC = -std=c++11 \
	   -lncurses \
	   -o \

clean :
	rm tp output.txt

all :
	g++ $(FLAGS) $(SRC) $(TRUC) tp \
	&& clear \
	&& ./tp