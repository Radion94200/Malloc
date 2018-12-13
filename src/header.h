#ifndef HEADER_H
#define HEADER_H
#define _GNU_SOURCE
#include <string.h>
#include <sys/mman.h>
#include <pthread.h>
#include <stdint.h>
#include <stddef.h>
#include <unistd.h>

/* Def of the Struct which is use for the Metadata */
struct metadata{
	int block_state;
	size_t block_size;
	struct metadata *next;
};

/* Def of the funcs in the malloc.c */
void *malloc(size_t __attribute__((unused)) size);

void free(void __attribute__((unused)) *ptr);

void *realloc(void __attribute__((unused)) *ptr,
             size_t __attribute__((unused)) size);

void *calloc(size_t __attribute__((unused)) nmemb,
             size_t __attribute__((unused)) size);

/* Def of the init_struct */
struct metadata *allocation(size_t newsize, struct metadata *init);

struct metadata *initialize(void);

struct metadata *check_space(size_t newsize, struct metadata *block);

struct metadata *split_allocation(size_t newsize, struct metadata *block);
#endif /* HEADER_H */
