# makefile for Lua decompiler

LUAVER=5.1
LUASRC=../lua-$(LUAVER)/src
LIBDIR=$(LUASRC)
BINDIR=../bin

LUA= $(LUASRC)/lua
LUAC= $(LUASRC)/luac
BIN2C = $(LUA) $(BINDIR)/bin2c.lua

DEV_NULL= /dev/null
CP= cp -f
RM= rm -f

CC= gcc
CFLAGS= -O2 -Wall -DSRCVERSION=\"$(SRCVERSION)\" $(INCS) $(MYCFLAGS)
LDFLAGS= $(MYLDFLAGS)
AR= ar rcu
RANLIB= ranlib
LIBS= -lm $(MYLIBS)

ifeq ($(wildcard /dev/null),)
	DEV_NULL= NUL
	RM= cmd //c del //f //s //q
endif

SRCVERSION=UNKNOWN
SVN_STATUS:=$(shell svn info 1>$(DEV_NULL) 2>$(DEV_NULL); echo $$?)
ifeq ($(SVN_STATUS),0)
	SRCVERSION:=$(shell svnversion -q -n .)
endif
GIT_STATUS:=$(shell git log -n 1 --format=format:%h 1>$(DEV_NULL) 2>$(DEV_NULL); echo $$?)
ifeq ($(GIT_STATUS),0)
	SRCVERSION:=$(shell git log -n 1 --format=format:%h)
endif

MYCFLAGS=
MYLDFLAGS=
MYLIBS=
MYOBJS=

INCS= -I$(LUASRC)
OBJS= guess.o luadec.o decompile.o disassemble.o proto.o StringBuffer.o structs.o statement.o macro-array.o expression.o
SRCS= guess.c luadec.c decompile.c disassemble.c proto.c StringBuffer.c structs.c statement.c macro-array.c expression.c

T= luadec

all: $T luareplace luaopswap

$T: $(OBJS) $(MYOBJS) $(LIBDIR)/liblua.a
	$(CC) -o $@ $(LDFLAGS) $^ $(LIBS)

debug:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG"

memwatch:
	$(MAKE) all MYCFLAGS="-g -DDEBUG -D_DEBUG -DMEMCHECK_MEMWATCH -I../memwatch/" MYOBJS="memwatch.o"

memwatch.o: ../memwatch/memwatch.c ../memwatch/memwatch.h
	$(CC) -o $@ -c $(CFLAGS) $(INCS) ../memwatch/memwatch.c

$(LIBDIR)/liblua.a:
	cd $(LUASRC); $(MAKE)

luareplace.o: luareplace.c
luareplace: luareplace.o $(LIBDIR)/liblua.a
	$(CC) -o $@ $(LDFLAGS) $^ $(LIBS)

allopcodes_lua.h: $(BINDIR)/allopcodes-$(LUAVER).lua
	$(BIN2C) $(BINDIR)/allopcodes-$(LUAVER).lua allopcodes_lua > allopcodes_lua.h
allopcodes.luac: $(BINDIR)/allopcodes-$(LUAVER).lua
	$(LUAC) -o allopcodes.luac $(BINDIR)/allopcodes-$(LUAVER).lua
allopcodes_luac.h: allopcodes.luac
	$(BIN2C) allopcodes.luac allopcodes_luac > allopcodes_luac.h

LUNDUMP:=
ifeq ($(LUAVER),5.1)
	LUNDUMP:=lundump-5.1.o
endif
lundump-5.1.o: lundump-5.1.c
luaopswap.o: luaopswap.c allopcodes_lua.h allopcodes_luac.h
luaopswap: luaopswap.o $(LUNDUMP) $(LIBDIR)/liblua.a
	$(CC) -o $@ $(LDFLAGS) $^ $(LIBS)

clean:
	$(RM) *.o *.exe
	$(RM) allopcodes*
