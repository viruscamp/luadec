/* luadec, based on luac */
#include "common.h"

#include "structs.h"

#include <assert.h>

void InitList(List * list) {
	list->head = NULL;
	list->tail = NULL;
	list->size = 0;
}

void AddToList(List * list, ListItem * item) {
	if (list == NULL || item == NULL)
		return;
	if (list->tail) {
		list->tail->next = item;
	} else {
		list->head = item;
	}
	item->prev = list->tail;
	item->next = NULL;
	list->tail = item;
	list->size++;
}

void AddToListHead(List * list, ListItem * item) {
	if (list==NULL || item==NULL)
		return;
	if (list->head) {
		list->head->prev = item;
	} else {
		list->tail = item;
	}
	item->prev = NULL;
	item->next = list->head;
	list->head = item;
	list->size++;
}

ListItem *LastItem(List * list) {
	return list->tail;
}

ListItem *PopFromList(List * list) {
	ListItem *walk, *prev;
	if (!list->tail) {
		return NULL;
	}
	walk = list->tail;
	prev = walk->prev;
	if (prev) {
		prev->next = NULL;
	} else {
		list->head = NULL;
	}
	list->tail = prev;
	walk->prev = NULL;
	walk->next = NULL;
	return walk;
}

void LoopList(List * list, ListItemFn fn, void* param) {
	ListItem *walk = list->head;
	while (walk) {
		ListItem *save = walk;
		walk = walk->next;
		fn(save, param);
	}
}

void ClearList(List * list) {
	ListItem *walk = list->head;
	while (walk) {
		ListItem *save = walk;
		walk = walk->next;
		free(save);
	}
	list->head = NULL;
	list->tail = NULL;
	list->size = 0;
}

ListItem *FindInList(List * list, ListItemCmpFn cmp, const void *sample) {
	ListItem *walk = list->head;
	while (walk) {
		if (cmp(walk, sample))
			return walk;
		walk = walk->next;
	}
	return NULL;
}

ListItem *RemoveFindInList(List * list, ListItemCmpFn cmp, const void *sample) {
	ListItem *walk = list->head;
	while (walk) {
		if (cmp(walk, sample)) {
			if (walk->prev != NULL) {
				walk->prev->next = walk->next;
			} else {
				list->head = walk->next;
			}
			if (walk->next != NULL) {
				walk->next->prev = walk->prev;
			} else {
				list->tail = walk->prev;
			}
			list->size--;
			walk->prev = NULL;
			walk->next = NULL;
			return walk;
		}
		walk = walk->next;
	}
	return NULL;
}

int AddToSet(IntSet * set, int a) {
	int i;
	if (! set->mayRepeat) {
		for (i = 0; i < set->ctr; i++) {
			if (set->values[i] == a)
				return 0;
		}
	}
	set->values[set->ctr] = a;
	set->ctr++;
	assert(set->ctr <= MAXARG_A);
	return 1;
}

int PeekSet(IntSet * set, int a) {
	int i;
	for (i = 0; i < set->ctr; i++) {
		if (set->values[i] == a) {
			return 1;
			break;
		}
	}
	return 0;
}

int PopSet(IntSet * set) {
	if (set->ctr == 0)
		return 0;
	set->ctr--;
	return set->values[set->ctr];
}

int RemoveFromSet(IntSet * set, int a) {
	int i;
	int at = -1;
	for (i = 0; i < set->ctr; i++) {
		if (set->values[i] == a) {
			at = i;
			break;
		}
	}
	if (at == -1)
		return 0;
	for (i = at; i < set->ctr; i++)
		set->values[i] = set->values[i + 1];
	set->ctr--;
	return 1;
}

void AddToVarStack(List* stack, char* dest, char* src, int reg) {
	VarListItem* var = (VarListItem*)calloc(1, sizeof(VarListItem));
	var->dest = dest;
	var->src = src;
	var->reg = reg;
	AddToList(stack, var);
}

