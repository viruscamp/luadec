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

const char* operators[NUM_OPCODES];
int priorities[NUM_OPCODES];

Inst extractInstruction(Instruction i) {
	Inst inst;
	inst.op = GET_OPCODE(i);
	inst.a = GETARG_A(i);
	inst.b = GETARG_B(i);
	inst.c = GETARG_C(i);
	inst.bx = GETARG_Bx(i);
	inst.sbx = GETARG_sBx(i);
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
	inst.ax = GETARG_Ax(i);
#endif
	return inst;
}

Instruction assembleInstruction(Inst inst) {
	Instruction i;
	switch (getOpMode(inst.op)) {
	case iABC:
		i = CREATE_ABC(inst.op, inst.a, inst.b, inst.c);
		break;
	case iABx:
		i = CREATE_ABx(inst.op, inst.a, inst.bx);
		break;
	case iAsBx:
		i = CREATE_ABx(inst.op, inst.a, inst.sbx);
		break;
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
	case iAx:
		i = CREATE_Ax(inst.op, inst.ax);
		break;
#endif
	}
	return i;
}

void InitOperators() {
	int i;
	for (i = 0; i < NUM_OPCODES; i++) {
		operators[i] = " ";
		priorities[i] = 0;
	}
	operators[OP_POW] = "^"; priorities[OP_POW] = 1;
	operators[OP_NOT] = "not "; priorities[OP_NOT] = 2;
	operators[OP_LEN] = "#"; priorities[OP_LEN] = 2;
	operators[OP_UNM] = "-"; priorities[OP_UNM] = 2;
	operators[OP_MUL] = "*"; priorities[OP_MUL] = 3;
	operators[OP_DIV] = "/"; priorities[OP_DIV] = 3;
	operators[OP_MOD] = "%"; priorities[OP_MOD] = 3;
	operators[OP_ADD] = "+"; priorities[OP_ADD] = 4;
	operators[OP_SUB] = "-"; priorities[OP_SUB] = 4;
	operators[OP_CONCAT] = ".."; priorities[OP_CONCAT] = 5;
#if LUA_VERSION_NUM == 503
	operators[OP_BNOT] = "~"; priorities[OP_BNOT] = 2;
	operators[OP_IDIV] = "//"; priorities[OP_IDIV] = 3;
	operators[OP_SHL] = "<<"; priorities[OP_SHL] = 6;
	operators[OP_SHR] = ">>"; priorities[OP_SHR] = 6;
	operators[OP_BAND] = "&"; priorities[OP_BAND] = 7;
	operators[OP_BXOR] = "~"; priorities[OP_BXOR] = 8;
	operators[OP_BOR] = "|"; priorities[OP_BOR] = 9;
#endif
}

char* convertToUpper(const char* str) {
	char *newstr, *p;
	p = newstr = strdup(str);
	while (*p++ = toupper(*p));
	return newstr;
}

int getEncoding(const char* enc) {
	int ret = 0;
	char* src = convertToUpper(enc);
	if (strcmp(src, "ASCII") == 0) {
		ret = ASCII;
	} else if (strcmp(src, "GB2312") == 0) {
		ret = GB2312;
	} else 	if (strcmp(src, "GBK") == 0) {
		ret = GBK;
	} else 	if (strcmp(src, "GB18030") == 0) {
		ret = GB18030;
	} else 	if (strcmp(src, "BIG5") == 0) {
		ret = BIG5;
	} else 	if (strcmp(src, "UTF8") == 0) {
		ret = UTF8;
	}
	free(src);
	return ret;
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
char* DecompileString(const TValue* o) {
	int i, utf8length;
	TString* ts = rawtsvalue(o);
	const unsigned char* s = (const unsigned char*)getstr(ts);
	int len = LUA_STRLEN(ts);
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
		return strdup(bvalue(o)?"true":"false");
	case LUA_TNIL:
		return strdup("nil");
#if LUA_VERSION_NUM == 501 || LUA_VERSION_NUM == 502
	case LUA_TNUMBER:
	{
		char* ret = (char*)calloc(128, sizeof(char));
		sprintf(ret, LUA_NUMBER_FMT, nvalue(o));
		return ret;
	}
	case LUA_TSTRING:
#ifdef LUA_TLNGSTR
	case LUA_TLNGSTR:
#endif
		return DecompileString(o);
#endif
#if LUA_VERSION_NUM == 503
	case LUA_TNUMFLT:
	{
		char* ret = (char*)calloc(128, sizeof(char));
		sprintf(ret, LUA_NUMBER_FMT, fltvalue(o));
		return ret;
	}
	case LUA_TNUMINT:
	{
		char* ret = (char*)calloc(128, sizeof(char));
		sprintf(ret, LUA_INTEGER_FMT, ivalue(o));
		return ret;
	}
	case LUA_TSHRSTR:
	case LUA_TLNGSTR:
		return DecompileString(o);
#endif
	default:
		return strdup("Unknown_Type_Error");
	}
}
