#ifndef STRUCTS_H
#define STRUCTS_H

#include <stdlib.h>
#include "lopcodes.h"

typedef struct ListItem_ ListItem;

struct ListItem_ {
   ListItem *next;
};

typedef void (*ListItemFn) (ListItem *, void *);
typedef int (*ListItemCmpFn) (ListItem *, const void *);

typedef struct List_ List;

struct List_ {
   ListItem *head;
   ListItem *tail;
   int size;
};

typedef struct IntSet_ IntSet;

struct IntSet_ {
   int values[MAXARG_A + 1];
   int ctr;
   int mayRepeat;
};

typedef struct VarStack_ VarStack;

struct VarStack_ {
   char* dests[MAXARG_A + 1];
   char* srcs[MAXARG_A + 1];
   int regs[MAXARG_A + 1];
   int ctr;
};

void InitList(List* list);
void AddToList(List* list, ListItem* item);
ListItem* LastItem(List* list);
ListItem* PopFromList(List* list);
void LoopList(List* list, ListItemFn fn, void* param);
ListItem* FindInList(List* list, ListItemCmpFn cmp, const void *sample);
int AddToSet(IntSet* set, int a);
int PeekSet(IntSet* set, int a);
int PopSet(IntSet* set);
int RemoveFromSet(IntSet* set, int a);
void AddToVarStack(VarStack* stack, char* dest, char* src, int reg);

#endif
