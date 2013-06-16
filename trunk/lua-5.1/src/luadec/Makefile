# makefile for Lua decompiler

LIBDIR=..
BINDIR=.

CC= gcc
CFLAGS= -O2 -Wall -DSRCVERSION=\"$(SRCVERSION)\" $(INCS) $(MYCFLAGS)
LDFLAGS= $(MYLDFLAGS)
AR= ar rcu
RANLIB= ranlib
RM= rm -f
LIBS= -lm $(MYLIBS)

SRCVERSION=$(shell svnversion -n .)
MYCFLAGS=
MYLDFLAGS=
MYLIBS=
MYOBJS=

INCS= -I..
OBJS= guess.o luadec.o decompile.o proto.o StringBuffer.o structs.o
SRCS= guess.c luadec.c decompile.c proto.c StringBuffer.c structs.c

T= luadec

all: $T

$T: $(OBJS) $(MYOBJS) $(LIBDIR)/liblua.a
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(MYOBJS) $(LIBDIR)/liblua.a $(LIBS)

debug:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG"

memwatch:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG -DMEMCHECK_MEMWATCH -I../memwatch/" MYOBJS="memwatch.o"

memwatch.o: ../memwatch/memwatch.c ../memwatch/memwatch.h
	$(CC) -o $@ -c $(CFLAGS) $(INCS) ../memwatch/memwatch.c

$(LIBDIR)/liblua.a:
	cd ..; $(MAKE)

clean:
	rm -f $(OBJS) $T

co:
	co -q -f -M $(SRCS)

klean: clean
	rm -f $(SRCS)
