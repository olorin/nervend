CC = gcc
CCFLAGS = 
BUILDDIR = build
SRCDIR = src

all: nervend

debug: CCFLAGS += -DDEBUG
debug: CCFLAGS += -g
debug: nervend

nervend.o :
	$(CC) $(CCFLAGS) -c $(SRCDIR)/nervend.c -o $(BUILDDIR)/nervend.o

nervend : nervend.o
	$(CC) $(CCFLAGS) -o nervend $(BUILDDIR)/nervend.o -lemokit -lusb-1.0 -lhidapi-hidraw -lmcrypt -lpthread -ludev

clean:
	rm -f build/*.o rm nervend
