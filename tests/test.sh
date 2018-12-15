#!/bin/sh

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`

echo "${YELLOW}TEST FOR MALLOC"

# TEST 1 #

num=1
cat Makefile > /tmp/cat.txt
LD_PRELOAD=./libmalloc.so cat Makefile > /tmp/malloccat.txt
DIFF=$(diff /tmp/cat.txt /tmp/malloccat.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: CAT MAKEFILE NOK"
else
	echo "${GREEN}TEST $num: CAT MAKEFILE OK"
fi

# TEST 2 #

num=2
ip a > /tmp/ip.txt
LD_PRELOAD=./libmalloc.so ip a > /tmp/mallocip.txt
DIFF=$(diff /tmp/ip.txt /tmp/mallocip.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: IP A NOK"
else
	echo "${GREEN}TEST $num: IP A OK"
fi

# TEST 3 #

num=3
factor 20 30 40 50 60 70 80 90 > /tmp/factor.txt
LD_PRELOAD=./libmalloc.so factor 20 30 40 50 60 70 80 90 > /tmp/mallocfactor.txt
DIFF=$(diff /tmp/factor.txt /tmp/mallocfactor.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: FACTOR X NOK"
else
	echo "${GREEN}TEST $num: FACTOR X OK"
fi

echo "${YELLOW}TEST FOR ADVANCED COMMANDS"

# TEST 4 #

num=4
LD_PRELOAD=./libmalloc.so ls > /tmp/mallocls.txt
ls > /tmp/ls.txt
DIFF=$(diff /tmp/ls.txt /tmp/mallocls.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LS NOK"
else
	echo "${GREEN}TEST $num: TEST LS OK"
fi

# TEST 5 #

num=5
LD_PRELOAD=./libmalloc.so \ls -la > /tmp/malloclsa.txt
\ls -la > /tmp/lsa.txt
DIFF=$(diff /tmp/lsa.txt /tmp/malloclsa.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LS-LA NOK"
else
	echo "${GREEN}TEST $num: TEST LS-LA OK"
fi

# TEST 6 #

num=6
LD_PRELOAD=./libmalloc.so find . > /tmp/mallocfind.txt
find . > /tmp/find.txt
DIFF=$(diff /tmp/find.txt /tmp/mallocfind.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST FIND NOK"
else
	echo "${GREEN}TEST $num: TEST FIND OK"
fi

# TEST 7 #

num=7
LD_PRELOAD=./libmalloc.so tree . > /tmp/malloctree.txt
tree . > /tmp/tree.txt
DIFF=$(diff /tmp/tree.txt /tmp/malloctree.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST TREE NOK"
else
	echo "${GREEN}TEST $num: TEST TREE OK"
fi

# TEST 8 #

num=8
LD_PRELOAD=./libmalloc.so less Makefile > /tmp/mallocless.txt
less Makefile > /tmp/less.txt
DIFF=$(diff /tmp/less.txt /tmp/mallocless.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LESS NOK"
else
	echo "${GREEN}TEST $num: TEST LESS OK"
fi


# TEST 9 #

num=9
LD_PRELOAD=./libmalloc.so git status > /tmp/mallocgit.txt
git status > /tmp/git.txt
DIFF=$(diff /tmp/git.txt /tmp/mallocgit.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST GIT NOK"
else
	echo "${GREEN}TEST $num: TEST GIT OK"
fi

# TEST 10 #

num=10
LD_PRELOAD=./libmalloc.so tar -cf malloc.tar libmalloc.so > /tmp/malloclib.txt
tar -cf malloc.tar libmalloc.so > /tmp/malloc.txt
DIFF=$(diff /tmp/malloc.txt /tmp/malloclib.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST TAR NOK"
else
	echo "${GREEN}TEST $num: TEST TAR OK"
fi

# TEST 11 #

num=11
LD_PRELOAD=./libmalloc.so od libmalloc.so > /tmp/malloc1.txt
od libmalloc.so > /tmp/malloc2.txt
DIFF=$(diff /tmp/malloc1.txt /tmp/malloc2.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST LIBMALLOC NOK"
else
	echo "${GREEN}TEST $num: TEST LIBMALLOC OK"
fi

# TEST 12 #

num=12
LD_PRELOAD=./libmalloc.so clang -h > /tmp/mallocclang.txt
clang -h > /tmp/clang.txt
DIFF=$(diff /tmp/clang.txt /tmp/mallocclang.txt)
if [ "$DIFF" != "" ] ; then 
	echo "${RED}TEST $num: TEST CLANG NOK"
else
	echo "${GREEN}TEST $num: TEST CLANG OK"
fi
