#include "common.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdarg.h>

#include "StringBuffer.h"

#ifdef _WIN32
	#define vsnprintf _vsnprintf
#endif

#define MAX(a,b) (((a)>(b))?(a):(b))

StringBuffer* StringBuffer_newBySize(int size) {
	StringBuffer* self = (StringBuffer*)calloc(1, sizeof(StringBuffer));
	self->bufferSize = MAX(STRINGBUFFER_BLOCK, size + 1);
	self->buffer = (char*)calloc(self->bufferSize, sizeof(char));
	self->usedSize = 0;
	return self;
}

StringBuffer* StringBuffer_new(const char* data) {
	StringBuffer* self = (StringBuffer*) calloc(1, sizeof(StringBuffer));
	if (data != NULL) {
		int len = strlen(data);
		self->bufferSize = MAX(STRINGBUFFER_BLOCK, len+1);
		self->buffer = (char*)calloc(self->bufferSize, sizeof(char));
		self->usedSize = len;
		strncpy(self->buffer, data, len+1);
	} else {
		self->bufferSize = STRINGBUFFER_BLOCK;
		self->buffer = (char*)calloc(self->bufferSize, sizeof(char));
		self->usedSize = 0;
	}
	return self;
}

void StringBuffer_delete(StringBuffer* self) {
	free(self->buffer);
	free(self);
}

void StringBuffer_makeRoom(StringBuffer* self, int neededSize) {
	if (self->bufferSize <= neededSize) {
		int newSize = self->bufferSize * 2;
		if (newSize < neededSize) {
			newSize += neededSize;
		}
		self->buffer = (char*)realloc(self->buffer, (newSize+1)*sizeof(char));
		self->bufferSize = newSize;
	}
}

void StringBuffer_addChar(StringBuffer* self, char ch) {
	StringBuffer_makeRoom(self, self->usedSize + 1);
	self->buffer[self->usedSize] = ch;
	self->usedSize++;
	self->buffer[self->usedSize] = '\0';
}

void StringBuffer_set(StringBuffer* self, const char* str) {
	int len = strlen(str);
	StringBuffer_makeRoom(self, len+1);
	strncpy(self->buffer, str, len+1);
	self->usedSize = len;
	self->buffer[self->usedSize] = '\0';
}

void StringBuffer_add(StringBuffer* self, const char* str) {
	int len = strlen(str);
	int end = self->usedSize;
	StringBuffer_makeRoom(self, self->usedSize + len+1);
	strncpy(self->buffer + end, str, len+1);
	self->usedSize += len;
	self->buffer[self->usedSize] = '\0';
}

void StringBuffer_prepend(StringBuffer* self, const char* str) {
	int len = strlen(str);
	int end = self->usedSize;
	int i;
	StringBuffer_makeRoom(self, self->usedSize + len+1);
	for (i = end; i >= 0; i--) {
		self->buffer[i+len] = self->buffer[i];
	}
	strncpy(self->buffer, str, len);
	self->usedSize += len;
}

void StringBuffer_addAll(StringBuffer* self, int n, ...) {
	int i;
	char* s;
	va_list ap;
	va_start(ap, n);
	for (i = 0; i < n; i++) {
		s = va_arg(ap, char*);
		StringBuffer_add(self, s);
	}
	va_end(ap);
}

void StringBuffer_printf(StringBuffer* self, char* format, ...) {
	va_list ap;
	int n, size = 100;
	while (1) {
		StringBuffer_makeRoom(self, size + 1);
		va_start(ap, format);
		n = vsnprintf(self->buffer, size, format, ap);
		va_end(ap);
		if (n > -1 && n < size) {
			self->usedSize = n;
			return;
		}
		size *= 2;
	}
}

void StringBuffer_addPrintf(StringBuffer* self, char* format, ...) {
	va_list ap;
	int n, size = 100;
	int end = self->usedSize;
	while (1) {
		StringBuffer_makeRoom(self, end + size + 1);
		va_start(ap, format);
		n = vsnprintf(self->buffer + end, size, format, ap);
		va_end(ap);
		if (n > -1 && n < size) {
			self->usedSize = end + n;
			return;
		}
		size *= 2;
	}
}

char* StringBuffer_getCopy(StringBuffer* self) {
	char* result = (char*)calloc(self->bufferSize+1, sizeof(char));
	strncpy(result, self->buffer, self->usedSize);
	result[self->usedSize] = '\0';
	return result;
}

const char* StringBuffer_getRef(StringBuffer* self) {
	return self->buffer;
}

char* StringBuffer_getBuffer(StringBuffer* self) {
	char* result = self->buffer;
	self->bufferSize = STRINGBUFFER_BLOCK;
	self->buffer = (char*)calloc(self->bufferSize, sizeof(char));
	self->usedSize = 0;
	return result;
}

void StringBuffer_setBuffer(StringBuffer* self, char* data) {
	free(self->buffer);
	self->buffer = data;
	self->usedSize = strlen(data);
	self->bufferSize = self->usedSize + 1;
}

void StringBuffer_prune(StringBuffer* self) {
	self->usedSize = 0;
	self->buffer[0] = '\0';
}
