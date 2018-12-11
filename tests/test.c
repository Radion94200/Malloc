#include <stdio.h>
#include "../src/header.h"
#ifndef HEADER_H
#define HEADER_H

#define RED     "\x1b[31m"
#define GREEN   "\x1b[32m"
#define YELLOW  "\x1b[33m"
#define BLUE    "\x1b[34m"
#define MAGENTA "\x1b[35m"
#define CYAN    "\x1b[36m"
#define RESET   "\x1b[0m"

/* TEST UNIT STRLEN */
void test_strlen()
{
	fprintf(stdout, YELLOW "TEST OF THE MYSTRLEN FUNC" RESET "\n");
	char test[4] = "tata";
	unsigned tmp = 0;
	tmp = mystrlen(test);
	if (tmp == 4)
		fprintf(stdout, GREEN "THIS TEST IS OK" RESET "\n");
	else 
		fprintf(stdout, RED "THIS TEST IS NOT OK" RESET "\n");
}

/* TEST ARRAY SIZE */
/*void test_array_size()
{
	
}*/

int main()
{
	test_strlen();
	//test_array_size();
	return 0;
}
#endif
