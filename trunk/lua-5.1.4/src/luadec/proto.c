#include "common.h"

#include "proto.h"

//#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"

// PrintString from luac is not 8-bit clean
char *DecompileString(const Proto * f, int n)
{
	int i;
	const unsigned char *s = (const unsigned char *)svalue(&f->k[n]);
	int len = (&(&f->k[n])->value.gc->ts)->tsv.len;
	char *ret = (char*)calloc(len * 4 + 3, sizeof(char*));
	int p = 0;
	ret[p++] = '"';
	for (i = 0; i < len; i++, s++) {
		switch (*s) {
		case '"':
			ret[p++] = '\\';
			ret[p++] = '"';
			break;
		case '\a':
			ret[p++] = '\\';
			ret[p++] = 'a';
			break;
		case '\b':
			ret[p++] = '\\';
			ret[p++] = 'b';
			break;
		case '\f':
			ret[p++] = '\\';
			ret[p++] = 'f';
			break;
		case '\n':
			ret[p++] = '\\';
			ret[p++] = 'n';
			break;
		case '\r':
			ret[p++] = '\\';
			ret[p++] = 'r';
			break;
		case '\t':
			ret[p++] = '\\';
			ret[p++] = 't';
			break;
		case '\v':
			ret[p++] = '\\';
			ret[p++] = 'v';
			break;
		case '\\':
			ret[p++] = '\\';
			ret[p++] = '\\';
			break;
		default:
			if ((*s < 32 || *s > 127) && !( *s >= 0x40 && *s <= 0xFE ) ){
				char* pos = &(ret[p]);
				sprintf(pos, "\\%d", *s);
				p += strlen(pos);
			} else {
				ret[p++] = *s;
			}
			break;
		}
	}
	ret[p++] = '"';
	ret[p] = '\0';
	return ret;
}

char *DecompileConstant(const Proto * f, int i)
{
	//  char* ret = calloc(4, sizeof(char*));
	//  sprintf(ret,"nil");
	//  return ret;
	const TValue *o = &f->k[i];
	switch (ttype(o)) {
		case LUA_TBOOLEAN: // Lua5.1 specific
			{
				if (o->value.b) {
					char *ret = (char*)calloc(6, sizeof(char*));
					strcpy(ret, "true");
					return ret;
				} else {
					char *ret = (char*)calloc(7, sizeof(char*));
					strcpy(ret, "false");
					return ret;
				}
			}
		case LUA_TNUMBER:
			{
				char *ret = (char*)calloc(100, sizeof(char*));
				sprintf(ret, LUA_NUMBER_FMT, nvalue(o));
				return ret;
			}
		case LUA_TSTRING:
			return DecompileString(f, i);
		case LUA_TNIL:
			{
				char *ret = (char*)calloc(4, sizeof(char*));
				strcpy(ret, "nil");
				return ret;
			}
		default:                   /* cannot happen */
			{
				char *ret = (char*)calloc(18, sizeof(char*));
				strcpy(ret, "Uknown_Type_Error");
				return ret;
			}
	}
}
