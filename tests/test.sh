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

#echo "${YELLOW}TEST FOR FREE"

# TEST 4 #

#num=4
#valgrind factor 20 30 40 50 60 70 80 90 > freefactor.txt
#LD_PRELOAD=./libmalloc.so valgrind factor 20 30 40 50 60 70 80 90 > mallocfree.txt
#DIFF=$(diff freefactor.txt mallocfree.txt)
#if [ "$DIFF" != "" ] ; then 
#	echo "${RED}TEST $num: FREE FACTOR NOK"
#else
#	echo "${GREEN}TEST $num: FREE FACTOR OK"
#fi

# TEST 5 #

#num=5
#valgrind ip a > freeip.txt
#LD_PRELOAD=./libmalloc.so valgrind ip a > mallocfreeip.txt
#DIFF=$(diff freeip.txt mallocfreeip.txt)
#if [ "$DIFF" != "" ] ; then 
#	echo "${RED}TEST $num: FREE IP NOK"
#else
#	echo "${GREEN}TEST $num: FREE IP OK"
#fi

echo "${YELLOW}TEST FOR ADVANCED COMMANDS"

# TEST 6 #

num=6
LD_PRELOAD=./libmalloc.so ls > /tmp/mallocls.txt
ls > /tmp/ls.txt
DIFF=$(diff /tmp/ls.txt /tmp/mallocls.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LS NOK"
else
	echo "${GREEN}TEST $num: TEST LS OK"
fi

# TEST 7 #

num=7
LD_PRELOAD=./libmalloc.so \ls -la > /tmp/malloclsa.txt
\ls -la > /tmp/lsa.txt
DIFF=$(diff /tmp/lsa.txt /tmp/malloclsa.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LS-LA NOK"
else
	echo "${GREEN}TEST $num: TEST LS-LA OK"
fi

# TEST 8 #

#num=8
#mkdir tree
#LD_PRELOAD=./libmalloc.so tree . > tree/malloctree.txt
#tree . > tree/tree.txt
#DIFF=$(diff tree/tree.txt tree/malloctree.txt)
#if [ "$DIFF" != "" ] ; then 
#	echo "${RED}TEST $num: TEST TREE NOK"
#else
#	echo "${GREEN}TEST $num: TEST TREE OK"
#fi
rm -rf tree
