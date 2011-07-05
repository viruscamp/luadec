# makefile for Lua decompiler

MYLIBS= ..
LIB=..
BIN=..

CC= gcc
CFLAGS= -O2 -Wall -I..
AR= ar rcu
RANLIB= ranlib
RM= rm -f
LIBS= -lm $(MYLIBS)

CFLAGS += -g

INCS= -I..
OBJS= guess.o luadec.o print.o proto.o StringBuffer.o structs.o lopcodes.o
SRCS= guess.c luadec.c print.c proto.c StringBuffer.c structs.c

T= luadec

all:	$T

$T:	$(OBJS) $(LIB)/liblua.a
	$(CC) -o $@ $(MYLDFLAGS) $(OBJS) -L$(LIB) $(INCS) -llua $(EXTRA_LIBS) $(DLLIB)

# print.c needs opcode names from lopcodes.c
lopcodes.o:	../lopcodes.c ../lopcodes.h
	$(CC) -o $@ -c $(CFLAGS)  $(INCS) -DLUA_OPNAMES ../lopcodes.c

$(LIB)/liblua.a:
	cd ..; $(MAKE)

clean:
	rm -f $(OBJS) $T

co:
	co -q -f -M $(SRCS)

klean:	clean
	rm -f $(SRCS)
