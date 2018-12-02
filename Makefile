CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 -fPIC\
         -fvisibility=hidden -fno-builtin
LDFLAGS = -shared
TARGET_LIB = libmalloc.so
OBJS = src/malloc.o
PFLAGS = -Wall -Wextra -Werror -pedantic -std=c99
SRCS = src/useful_func.c tests/test.c
OBJ = ${SRCS:.c=.o}

.PHONY: all ${TARGET_LIB} clean make

${TARGET_LIB}: ${OBJS}
	${CC} ${LDFLAGS} -o $@ $^

all: ${TARGET_LIB}

check : ${OBJ}
		${CC} -o test ${OBJ} ${PFLAGS}

clean:
	${RM} ${TARGET_LIB} ${OBJS}
	${RM} src/.*.swp
	${RM} src/.*.swo
	${RM} src/*.o
	${RM} src/.*.swo
	${RM} .*.swp
	${RM} tests/*.o
