SRC =	*.cpp

FLAGS = -Wall \
		-Wextra \
		-Werror \

TRUC = -std=c++11 \
	   -lncurses \
	   -o \

all :
	g++ $(FLAGS) $(SRC) $(TRUC) tp \
	&& clear \
	&& ./tp

clean :
	rm -f text.txt tp output.txt \
	&& clear