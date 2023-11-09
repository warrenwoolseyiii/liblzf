CC = gcc
CFLAGS = -I./impl -Wall
SRCDIR = impl
EXDIR = example
OBJDIR = obj
BINDIR = bin

# Find all .c files in the impl directory
IMPL_SOURCES = $(wildcard $(SRCDIR)/*.c)
# Find the main .c file in the example directory
MAIN_SOURCE = $(EXDIR)/lzf.c
# Replace the .c from IMPL_SOURCES with .o
OBJECTS = $(IMPL_SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
# Define the executable file
TARGET = $(BINDIR)/example

all: $(TARGET)

$(TARGET): $(OBJECTS) $(OBJDIR)/lzf.o | $(BINDIR)
	$(CC) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/lzf.o: $(MAIN_SOURCE) | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $@

$(BINDIR):
	mkdir -p $@

clean:
	rm -rf $(OBJDIR) $(BINDIR)
