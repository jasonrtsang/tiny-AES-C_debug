
## This is a simple Makefile with lots of comments 

# Define what compiler to use and the flags.
CC=cc
CXX=CC
CCFLAGS= -g -std=c99 -Wall -Werror

# A rule in Makefile has the form:
#
# target: dependencies
#command
#
# where "target" and "dependencies" are files (most of the time).
# These means that if "target" does not exist or the modification 
# date of the dependencies are older than the modification time of
# "target" then "command" is executed.
#
# For example, the rule 
#
# test_aes.o : test_aes.c
#$(CC) -c $(CCFLAGS) test_aes.c
#
# means that if test_aes.o does not exist, or if test_aes.c is older
# than test_aes.o, then execute "$(CC) -c $(CCFLAGS) test_aes.c".
#
# The goal of make is to execute the minimum set of commands that
# are necessary to build the target files. i.e., it does not rebuild
# files that it expects need not be rebuilt because they have not changed.
#
# Usually, the first target in a Makefile is called "all". 
# The dependencies of "all" are the files (or make targets) that we want to build.
#

all: test_aes

# Compile all .c files into .o files
# % matches all (like * in a command)
# $< is the source file (.c file)
%.o : %.c
	$(CC) -c $(CCFLAGS) $<

test_aes: aes.o test.o
	$(CC) -o test_aes aes.o test.o

test: test_aes
	./test_aes

clean:
	rm -f core *.o test_aes
