#include "header.h"

/*Function which split allcation for CS */
struct metadata *split_allocation(size_t newsize, struct metadata *block)
{
    struct metadata *oldnext = block->next;
    size_t sizetmp = block->block_size;
    block->block_state = 1;
    block->block_size =  newsize;
    if (sizetmp - newsize > (sizeof(struct metadata) + 16))
    {
        block->next = (struct metadata *)(((char *)block) + newsize
            + sizeof(struct metadata));
        struct metadata *newdata = block->next;
        newdata->block_state = 0;
        newdata->block_size = sizetmp - (sizeof(struct metadata)
            + newsize);
        newdata->next = oldnext;
    }
    return block + 1;
}

/* Function which initialize the malloc on the correct space */
struct metadata *allocation(size_t newsize, struct metadata *block)
{
    if (newsize < (sysconf(_SC_PAGESIZE) - sizeof(struct metadata)))
    {
        struct metadata *tpm = check_space(newsize, block);
        if (tpm != NULL)
        {
            return split_allocation(newsize, tpm);
        }
        else
        {
            struct metadata *tmp = initialize();
            while (tpm->next != NULL)
                tpm = tpm->next;
            tpm->next = tmp;
            allocation(newsize, tmp);
        }
    }
    else
    {
        size_t length = newsize / sysconf(_SC_PAGESIZE) + 1;
        void *new_page = mmap(NULL, sysconf(_SC_PAGESIZE) * length,
            PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (new_page == MAP_FAILED)
            return NULL;
        struct metadata *new_addr = new_page;
        block->next = new_addr;
        return new_addr + 1;
    }
    return 0;
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
    while (block != NULL)
    {
        if (newsize < block->block_size && block->block_state == 0)
            return block;
        block = block->next;
    }
    return NULL;
}
