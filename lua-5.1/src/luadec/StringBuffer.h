#ifndef LUADEC_STRINGBUFFER_H
#define LUADEC_STRINGBUFFER_H

#include <stdlib.h>
#include <string.h>

#define STRINGBUFFER_BLOCK 256

typedef struct StringBuffer_ StringBuffer;
struct StringBuffer_ {
	char* buffer;
	int bufferSize;
	int usedSize;
};

#define StringBuffer_strlen(self) ((self)->usedSize)

#define StringBuffer_firstChar(self) ((self)->buffer[0])

#define StringBuffer_lastChar(self) ((self)->buffer[(self)->usedSize - 1])

StringBuffer* StringBuffer_newBySize(int size);

StringBuffer* StringBuffer_new(const char* data);

void StringBuffer_delete(StringBuffer* self);

void StringBuffer_makeRoom(StringBuffer* self, int neededSize);

void StringBuffer_addChar(StringBuffer* self, char ch);

void StringBuffer_add(StringBuffer* self, const char* str);

void StringBuffer_prepend(StringBuffer* self, const char* str);

void StringBuffer_set(StringBuffer* self, const char* str);

void StringBuffer_addAll(StringBuffer* self, int n, ...);

#ifdef __GNUC__
	#define PRINTF_FUNCTION __attribute__ ((format (printf, 2, 3)))
#else
	#define PRINTF_FUNCTION
#endif

void StringBuffer_printf(StringBuffer* self, char* format, ...) PRINTF_FUNCTION;

void StringBuffer_addPrintf(StringBuffer* self, char* format, ...) PRINTF_FUNCTION;

// get a copy of StringBuffer.buffer
char* StringBuffer_getCopy(StringBuffer* self);

// transfer the ownership of self->buffer to return, leave a empty StringBuffer
char* StringBuffer_getBuffer(StringBuffer* self);

// self will get the ownership of data
void StringBuffer_setBuffer(StringBuffer* self, char* data);

// return self->buffer , you should use it readonly
const char* StringBuffer_getRef(StringBuffer* self);

void StringBuffer_prune(StringBuffer* self);

#endif // #ifndef LUADEC_STRINGBUFFER_H
