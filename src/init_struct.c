#ifndef HEADER_H
#define HEADER_H

/* Function which initialize the mmap */
void *new_allocation((struct metadata *init))
{
	if (init->size < 4096)
	{
		
	}
	if (init->size > 4096)
	{
	void *new_page = mmap(NULL, sysconf(_SC_PAGESIZE), 
		PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (new_page == MAP_FAILED)
		return NULL;
	struct metadata *new_addr = new_page;
	init->next = new_addr;
	}
}

/* Function which initialize the metadata struct */
void *initialize(void)
{
	void *tmp = mmap(NULL, sysconf(_SC_PAGESIZE), 
		PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (tmp == MAP_FAILED)
		return NULL;
	struct metadata *addr = tmp;
	addr->next = NULL;
	addr->block_size = sysconf(_SC_PAGESIZE) - sizeof(struct metadata *);
	addr->block_state = 0;
	return addr;
}

/* Function which initialize the array of size */

#endif
