
## This is a simple Makefile with lots of comments 

# Define what compiler to use and the flags.
CC=cc
CFLAGS= -g -std=c99 -Werror

# -Wall Warning CFLAG

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

verbose: CFLAGS+=-DVERBOSE=1
binaries=test_ecb test_cbc test_ecb_verbose test_cbc_verbose

# Compile all .c files into .o files
# % matches all (like * in a command)
# $< is the source file (.c file)
%.o : %.c
	$(CC) -c $(CFLAGS) $<

all: aes.o test_ecb.o test_cbc.o
	$(CC) -o test_ecb aes.o test_ecb.o
	$(CC) -o test_cbc aes.o test_cbc.o
	rm -f core *.o

verbose: aes.o test_ecb.o test_cbc.o
	$(CC) -o test_ecb_verbose aes.o test_ecb.o
	$(CC) -o test_cbc_verbose aes.o test_cbc.o
	rm -f core *.o

clean:
	rm -f core $(binaries)
