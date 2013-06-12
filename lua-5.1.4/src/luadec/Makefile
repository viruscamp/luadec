# makefile for Lua decompiler

LIBDIR=..
BINDIR=.

CC= gcc
CFLAGS= -O2 -Wall $(INCS) $(MYCFLAGS)
LDFLAGS= $(MYLDFLAGS)
AR= ar rcu
RANLIB= ranlib
RM= rm -f
LIBS= -lm $(MYLIBS)

MYCFLAGS=
MYLDFLAGS=
MYLIBS=
MYOBJS=

INCS= -I..
OBJS= guess.o luadec.o print.o proto.o StringBuffer.o structs.o lopcodes.o
SRCS= guess.c luadec.c print.c proto.c StringBuffer.c structs.c

T= luadec

all: $T

$T: $(OBJS) $(MYOBJS) $(LIBDIR)/liblua.a
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(MYOBJS) -L$(LIBDIR) -llua

debug:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG"

memwatch:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG -DMEMCHECK_MEMWATCH -I../memwatch/" MYOBJS="memwatch.o"

# print.c needs opcode names from lopcodes.c
lopcodes.o:	../lopcodes.c ../lopcodes.h
	$(CC) -o $@ -c $(CFLAGS) $(INCS) -DLUA_OPNAMES ../lopcodes.c

memwatch.o: ../memwatch/memwatch.c ../memwatch/memwatch.h
	$(CC) -o $@ -c $(CFLAGS) $(INCS) ../memwatch/memwatch.c

$(LIB)/liblua.a:
	cd ..; $(MAKE)

clean:
	rm -f $(OBJS) $T

co:
	co -q -f -M $(SRCS)

klean: clean
	rm -f $(SRCS)
