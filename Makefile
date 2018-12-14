CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 -fPIC\
         -fvisibility=hidden -fno-builtin
LDFLAGS = -shared
TARGET_LIB = libmalloc.so
OBJS = src/malloc.o src/init_struct.o
OBJ = ${SRCS:.c=.o}

.PHONY: all ${TARGET_LIB} clean make

${TARGET_LIB}: ${OBJS}
	${CC} ${LDFLAGS} -o $@ $^

all: ${TARGET_LIB}

check : ${TARGET_LIB}
	tests/test.sh | column -t

clean:
	${RM} ${TARGET_LIB} ${OBJS}
	${RM} src/.*.swp
	${RM} src/.*.swo
	${RM} src/*.o
	${RM} src/.*.swo
	${RM} .*.swp
	${RM} tests/*.o
	${RM} test
	${RM} *.txt
