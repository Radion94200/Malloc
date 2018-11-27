CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 -fPIC\
         -fvisibility=hidden -fno-builtin
LDFLAGS = -shared
TARGET_LIB = libmalloc.so
OBJS = src/malloc.o

.PHONY: all ${TARGET_LIB} clean make

${TARGET_LIB}: ${OBJS}
	${CC} ${LDFLAGS} -o $@ $^

all: ${TARGET_LIB}

check : tests/test.c $@
	tests/test.c | column -t

clean:
	${RM} ${TARGET_LIB} ${OBJS}
