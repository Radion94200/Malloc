#include "header.h"

static struct metadata *meta;

__attribute__((visibility("default")))
void *malloc(size_t __attribute__((unused)) size)
{
	meta = initialize();
	check_space(size ,meta);
	return allocation(size ,meta); 
}

__attribute__((visibility("default")))
void free(void __attribute__((unused)) *ptr)
{
	ptr = &ptr - meta->block_size;
	ptr = 0;
}

__attribute__((visibility("default")))
void *realloc(void __attribute__((unused)) *ptr,
             size_t __attribute__((unused)) size)
{
	return malloc(size);
}

__attribute__((visibility("default")))
void *calloc(size_t __attribute__((unused)) nmemb,
             size_t __attribute__((unused)) size)
{
	return NULL;
}
