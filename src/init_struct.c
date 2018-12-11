#ifndef HEADER_H
#define HEADER_H

/* Function which initialize the mmap */
struct metadata *allocation(size_t newsize, struct metadata *block)
{
	if (init_size < (sysconf(SC_PAGESIZE)))
	{
		block->block_state = 1;
		block->block_size =  newsize;
		block->next = (struct metadata *)((char *)(block) + newsize + 
			sizeof(struct metadata));
	}
	else
	{
		void *new_page = mmap(NULL, sysconf(_SC_PAGESIZE), 
			PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
		if (new_page == MAP_FAILED)
			return NULL;
		struct metadata *new_addr = new_page;
		init->next = new_addr;
		new_addr->prev = init;
	}
}

/* Function which initialize the metadata struct */
struct metadata *initialize(void)
{
	void *tmp = mmap(NULL, sysconf(_SC_PAGESIZE), 
		PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (tmp == MAP_FAILED)
		return NULL;
	struct metadata *addr = tmp;
	addr->next = NULL;
	addr->block_size = sysconf(_SC_PAGESIZE) - sizeof(struct metadata);
	addr->block_state = 0;
	return addr;
}

/* Function which check free space */
struct metadata *check_space(size_t newsize, struct metadata *block)
{
	while (block->next != NULL)
	{
		if (newsize < block->block_size && bloc->block_state == 0)
			return block; 	
		else
			block = block->next;
	}
	return NULL;
}
#endif /* HEADER_H */
