# Compiler
CC := gcc

# Compiler flags
CFLAGS := -Wall -Wextra

# Target executable
TARGET := writer

# Source files
SRCS := $(wildcard *.c)

# Object files
OBJS := $(SRCS:.c=.o)

# Cross-compilation prefix
CROSS_COMPILE ?=

# Default target
.PHONY: all
all: $(TARGET)

# Rule to build the executable
$(TARGET): $(OBJS)
	$(CROSS_COMPILE)$(CC) $(CFLAGS) -o $@ $^

# Rule to compile source files
%.o: %.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) -c -o $@ $<

# Clean target
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)
