#ifndef T
	#error You must define T before include macro_array.h
#endif

#include <stdlib.h>
#include <assert.h>

#define _CAT2(x,y) x##y
#define CAT2(x,y) _CAT2(x,y)

#define TArray CAT2(T,Array)
#define TArray_ CAT2(T,Array_)

typedef struct TArray_ TArray;
struct TArray_ {
	int capacity;
	int size;
	T* values;
};

#define TArray_Init CAT2(T,Array_Init)
extern void TArray_Init(TArray* ia, int init_capacity);

#define TArray_Clear CAT2(T,Array_Clear)
extern void TArray_Clear(TArray* ia);

#define TArray_Push CAT2(T,Array_Push)
extern void TArray_Push(TArray* ia, T value);

#define TArray_Size CAT2(T,Array_Size)
extern int TArray_Size(TArray* ia);

#define TArray_Pop CAT2(T,Array_Pop)
extern T TArray_Pop(TArray* ia);

#define TArray_Peek CAT2(T,Array_Peek)
extern T TArray_Peek(TArray* ia);

#define TArray_Get CAT2(T,Array_Get)
extern T TArray_Get(TArray* ia, int idx);

#define TArray_Set CAT2(T,Array_Set)
extern void TArray_Set(TArray* ia, int idx, T value);


#ifdef TArray_IMPLEMENT

void TArray_Init(TArray* ia, int init_capacity) {
	ia->capacity = init_capacity;
	ia->size = 0;
	ia->values = (T*)calloc(init_capacity, sizeof(T));
}

void TArray_Clear(TArray* ia) {
	ia->capacity = 0;
	ia->size = 0;
	free(ia->values);
	ia->values = (void*)0;
}

void TArray_Push(TArray* ia, T value) {
	if (ia->size >= ia->capacity) {
		ia->capacity = ia->capacity * 2;
		ia->values = (T*)realloc(ia->values, (ia->capacity) * sizeof(T));
	}
	ia->values[ia->size] = value;
	ia->size++;
}

int TArray_Size(TArray* ia) {
	return ia->size;
}

T TArray_Pop(TArray* ia) {
	assert(ia->size > 0);
	ia->size--;
	return ia->values[ia->size];
}

T TArray_Peek(TArray* ia) {
	assert(ia->size > 0);
	return ia->values[ia->size - 1];
}

T TArray_Get(TArray* ia, int idx) {
	assert(idx < ia->size);
	return ia->values[idx];
}

void TArray_Set(TArray* ia, int idx, T value) {
	assert(idx < ia->size);
	ia->values[idx] = value;
}

#undef TArray_IMPLEMENT
#endif // TArray_IMPLEMENT

#undef TArray
#undef TArray_
#undef TArray_Init
#undef TArray_Clear
#undef TArray_Push
#undef TArray_Size
#undef TArray_Pop
#undef TArray_Peek
#undef TArray_Get
#undef TArray_Set
