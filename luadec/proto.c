#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"

#include "lua-compat.h"
#include "proto.h"

const char* operators[22] = {
	" ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ",
	" ", " ","+", "-", "*",
	"/", "%", "^", "-", "not ",
	"#", ".."
}; // Lua5.1 specific

const int priorities[22] = {
	0, 0, 0, 0, 0,
	0, 0, 0, 0, 0,
	0, 0, 4, 4, 3,
	3, 3, 1, 2, 2,
	2, 5
}; // Lua5.1 specific

char* convertToUpper(const char* str) {
	char *newstr, *p;
	p = newstr = strdup(str);
	while (*p++ = toupper(*p));
	return newstr;
}

int getEncoding(const char* enc) {
	char* src = convertToUpper(enc);
	if (strcmp(src, "ASCII") == 0) {
		return ASCII;
	}
	if (strcmp(src, "GB2312") == 0) {
		return GB2312;
	}
	if (strcmp(src, "GBK") == 0) {
		return GBK;
	}
	if (strcmp(src, "GB18030") == 0) {
		return GB18030;
	}
	if (strcmp(src, "BIG5") == 0) {
		return BIG5;
	}
	if (strcmp(src, "UTF8") == 0) {
		return UTF8;
	}
	free(src);
	return 0;
}


int isUTF8(const unsigned char* buff, int size) {
	int utf8length;
	const unsigned char* currchr = buff;
	if (*currchr < 0x80) { // (10000000): 1 byte ASCII
		utf8length = 1;
	} else if (*currchr < 0xC0) { // (11000000): invalid
		utf8length = 0;
		return utf8length;
	} else if (*currchr < 0xE0) { // (11100000): 2 byte
		utf8length = 2;
	} else if (*currchr < 0xF0) { // (11110000): 3 byte
		utf8length = 3;
	} else if (*currchr < 0xF8) { // (11111000): 4 byte
		utf8length = 4;
	} else if (*currchr < 0xFC) { // (11111100): 5 byte
		utf8length = 5;
	} else if (*currchr < 0xFE) { // (11111110): 6 byte
		utf8length = 6;
	} else { // invalid
		utf8length = 0;
		return utf8length;
	}
	if (utf8length > size) {
		utf8length = 0;
		return utf8length;
	}
	currchr++;
	while (currchr < buff + utf8length) {
		if ((*currchr&0xC0) != 0x80) { // 10xxxxxx
			utf8length = 0;
			return utf8length;
		}
		currchr++;
	}
	return utf8length;
}

// PrintString from luac is not 8-bit clean
char* DecompileString(const Proto* f, int n) {
	int i, utf8length;
	TString* ts = rawtsvalue(&f->k[n]);
	const unsigned char* s = (const unsigned char*)getstr(ts);
	int len = ts->tsv.len;
	char* ret = (char*)calloc(len * 4 + 3, sizeof(char));
	int p = 0;
	ret[p++] = '"';
	for (i = 0; i < len; i++, s++) {
		switch (*s) {
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
		case '"':
			ret[p++] = '\\';
			ret[p++] = '"';
			break;
		case '\'':
			ret[p++] = '\\';
			ret[p++] = '\'';
			break;
		default:
			if (*s >= 0x20 && *s < 0x7F) {
				ret[p++] = *s;
			} else if (string_encoding == GB2312 && i+1 < len
				&& *s >= 0xA1 && *s <= 0xF7
				&& *(s+1) >= 0xA1 && *(s+1) <= 0xFE
				) {
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
			} else if ((string_encoding == GBK || string_encoding == GB18030) && i+1 < len
				&& *s >= 0x81 && *s <= 0xFE
				&& *(s+1) >= 0x40 && *(s+1) <= 0xFE && *(s+1) != 0x7F
				) {
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
			} else if (string_encoding == GB18030 && i+3 < len
				&& *s >= 0x81 && *s <= 0xFE
				&& *(s+1) >= 0x30 && *(s+1) <= 0x39
				&& *(s+2) >= 0x81 && *(s+2) <= 0xFE
				&& *(s+3) >= 0x30 && *(s+3) <= 0x39
				) {
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
			} else if (string_encoding == BIG5 && i+1 < len
				&& *s >= 0x81 && *s <= 0xFE
				&& ((*(s+1) >= 0x40 && *(s+1) <= 0x7E) || (*(s+1) >= 0xA1 && *(s+1) <= 0xFE))
				) {
				ret[p++] = *s;
				i++; s++;
				ret[p++] = *s;
			} else if (string_encoding == UTF8 && (utf8length = isUTF8(s, len-i)) > 1) {
				int j;
				ret[p++] = *s;
				for (j = 0; j < utf8length-1; j++) {
					i++; s++;
					ret[p++] = *s;
				}
			} else {
				char* pos = &(ret[p]);
				sprintf(pos, "\\%03d", *s);
				p += strlen(pos);
			}
			break;
		}
	}
	ret[p++] = '"';
	ret[p] = '\0';
	return ret;
}

char* DecompileConstant(const Proto* f, int i) {
	const TValue* o = &f->k[i];
	switch (ttype(o)) {
	case LUA_TBOOLEAN:
		{
			if (bvalue(o)) {
				char* ret = strdup("true");
				return ret;
			} else {
				char* ret = strdup("false");
				return ret;
			}
		}
	case LUA_TNUMBER:
		{
			char* ret = (char*)calloc(100, sizeof(char));
			sprintf(ret, LUA_NUMBER_FMT, nvalue(o));
			return ret;
		}
	case LUA_TSTRING:
		{
			return DecompileString(f, i);
		}
	case LUA_TNIL:
		{
			char* ret = strdup("nil");
			return ret;
		}
	default:
		{
			char* ret = strdup("Unknown_Type_Error");
			return ret;
		}
	}
}
