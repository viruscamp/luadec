#ifndef STRUCTS_H
#define STRUCTS_H

#include <stdlib.h>
#include "lopcodes.h"

/*
** List is a doubly-linked list
*/
typedef struct ListItem_ ListItem;
struct ListItem_ {
	ListItem* next;
	ListItem* prev;
};

typedef struct List_ List;
struct List_ {
	ListItem* head;
	ListItem* tail;
	int size;
};

typedef void (*ListItemFn) (ListItem*, void*);
typedef int (*ListItemCmpFn) (ListItem*, const void*);

List* NewList();
void InitList(List* list);
void AddToList(List* list, ListItem* item);
void AddToListHead(List* list, ListItem* item);
ListItem* FirstItem(List* list);
ListItem* LastItem(List* list);
ListItem* PopFromList(List* list);
void LoopList(List* list, ListItemFn fn, void* param);
void ClearList(List* list, ListItemFn fn);
ListItem* FindFromListHead(List* list, ListItemCmpFn cmp, const void* sample);
ListItem* FindFromListTail(List* list, ListItemCmpFn cmp, const void* sample);
ListItem* RemoveFromList(List* list, ListItem* item);

/*
** IntSet is a Stack that has a limited capacity
*/
typedef struct IntSet_ IntSet;
struct IntSet_ {
	int values[MAXARG_A + 1];
	int ctr;
	int mayRepeat;
};

int AddToSet(IntSet* set, int a);
int PeekSet(IntSet* set, int a);
int PopSet(IntSet* set);
int RemoveFromSet(IntSet* set, int a);

/*
** a Stack use List
*/
typedef struct VarListItem_ VarListItem;
struct VarListItem_ {
	ListItem super;
	char* dest;
	char* src;
	int reg;
};

void AddToVarList(List* stack, char* dest, char* src, int reg);
void ClearVarListItem(VarListItem* item, void* dummy);

#endif
