CC := g++
SRCDIR := src
BUILDDIR := build
NAME := file_name
TARGET := bin/$(NAME)

SRCEXT := cpp

ifeq ($(OS), Windows_NT)
	FINDPREFIX := C:\\Program Files (x86)\\GnuWin32\\bin\\
else
	FINDPREFIX := ""
endif

SOURCES := $(shell $(FINDPREFIX)find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := -g
LIB := -L lib
INC := -I include

$(TARGET): $(OBJECTS)
	$(CC) $^ -o $(TARGET) $(LIB)
	$(CC) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	$(RM) -r $(BUILDDIR) $(TARGET)
	$(RM) -r $(BUILDDIR) $(TARGET)

.PHONY: clean