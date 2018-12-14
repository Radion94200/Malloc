#include "header.h"

static struct metadata *meta = NULL;

__attribute__((visibility("default")))
void *malloc(size_t __attribute__((unused)) size)
{
	//if (meta == NULL)
		meta = initialize();
	//check_space(size, meta);
	//if (check_space(size, meta) == NULL)
	//	initialize();
	return allocation(size ,meta); 
}

__attribute__((visibility("default")))
void free(void __attribute__((unused)) *ptr)
{
	if (ptr == NULL)
		return;
	void * beginstruct = (char *)(ptr) - sizeof(struct metadata);
	struct metadata * tmp = beginstruct;
	tmp->block_state = 0;
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
	return memset(malloc(size * nmemb), 0, (size * nmemb));
}
