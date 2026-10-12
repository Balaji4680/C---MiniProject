# Phone Book App - Makefile
# Adding a file: put the new .c file in this folder, then run "make".
# Removing a file: delete the .c file, then run "make clean" and "make".

CC      = gcc
CFLAGS  = -Wall -Wextra -g
TARGET  = phonebook

# Every .c file in the folder is compiled automatically.
# file.c is the old duplicate of load_contacts(), so it is skipped.
# Add any other file you want to skip inside filter-out.
SRCS = $(filter-out file.c, $(wildcard *.c))
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Every object file is rebuilt if phonebook.h changes
%.o: %.c phonebook.h
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all run clean
