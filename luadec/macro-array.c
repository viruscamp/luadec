#include "lobject.h"

#define T int
#define TArray_IMPLEMENT
#include "macro-array.h"
#undef T

#define T LocVar
#define TArray_IMPLEMENT
#include "macro-array.h"
#undef T
