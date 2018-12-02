#ifndef HEADER_H
#define HEADER_H

/* Function strlen */
/* Test of this one ok*/
unsigned mystrlen(char *string)
{
	unsigned count = 0;
	for (unsigned i = 0; string[i] != '\0'; i++)
	{
		count++;
	}
	return count;
}
#endif 
