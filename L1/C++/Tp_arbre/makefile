SRC =	*.cpp

FLAGS1 = -Wall \
		-Wextra \
		-Werror \

FLAGS2 = -std=c++11 \
	   -lncurses \
	   -o \

compile :
	g++ $(FLAGS1) $(SRC) $(FLAGS2) program && \
	clear && \
	./program

clean :
	find . -name "*.txt" ! -name "dic-moyen.txt" -delete && \
	rm -f *.cor program && \
	clear