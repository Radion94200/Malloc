#!/bin/sh

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`

echo "${YELLOW}TEST FOR MALLOC"

# TEST 1 #

num=1
cat Makefile > cat.txt
LD_PRELOAD=./libmalloc.so cat Makefile > malloccat.txt
DIFF=$(diff cat.txt malloccat.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: CAT MAKEFILE NOK"
else
	echo "${GREEN}TEST $num: CAT MAKEFILE OK"
fi


# TEST 2 #

num=2
ip a > ip.txt
LD_PRELOAD=./libmalloc.so ip a > mallocip.txt
DIFF=$(diff ip.txt mallocip.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: IP A NOK"
else
	echo "${GREEN}TEST $num: IP A OK"
fi

# TEST 3 #

num=3
factor 20 30 40 50 60 70 80 90 > factor.txt
LD_PRELOAD=./libmalloc.so factor 20 30 40 50 60 70 80 90 > mallocfactor.txt
DIFF=$(diff factor.txt mallocfactor.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: FACTOR X NOK"
else
	echo "${GREEN}TEST $num: FACTOR X OK"
fi

echo "${YELLOW}TEST FOR FREE"

