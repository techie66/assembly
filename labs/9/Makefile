#===========================================

# Makefile for CSC300 Data Structures.

# Author: John M. Weiss, Ph.D.
# Written September 10, 2007

# Usage:	make target1 target2 ...

#===========================================

# Define some useful vars:

# GNU C/C++ compiler and linker:
CC = gcc
CXX = g++
LINK = g++
ASM = nasm

# Turn on optimization and warnings (add -g for debugging with gdb):
# CPPFLAGS = 		# no preprocessor flags
CFLAGS = -O -Wall
CXXFLAGS = -O -Wall
ASMFLAGS = -f elf

%.o : %.asm
	$(ASM) $(ASMFLAGS) $^

#===========================================

# Targets (remove -s for debugging with gdb):

all: lab

lab: lab.o func.o lab9main.o
	$(CC) $^ -o $@
clean:
	rm *.o lab
#===========================================

