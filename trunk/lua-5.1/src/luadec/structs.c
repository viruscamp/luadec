/* luadec, based on luac */
#include "common.h"

#include "structs.h"

#include <assert.h>

List* NewList() {
	List* list = (List*)calloc(1, sizeof(List));
	return list;
}

void InitList(List* list) {
	list->head = NULL;
	list->tail = NULL;
	list->size = 0;
}

void AddToList(List* list, ListItem* item) {
	if (!list || !item) {
		return;
	}
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

void AddToListHead(List* list, ListItem* item) {
	if (!list || !item) {
		return;
	}
	if (list->head) {
		list->head->prev = item;
	} else {
		list->tail = item;
	}
	item->next = list->head;
	item->prev = NULL;
	list->head = item;
	list->size++;
}

ListItem* FirstItem(List* list) {
	return list->head;
}

ListItem* LastItem(List* list) {
	return list->tail;
}

ListItem* PopFromList(List* list) {
	return RemoveFromList(list, list->tail);
}

void LoopList(List* list, ListItemFn fn, void* param) {
	ListItem* walk = list->head;
	while (walk) {
		ListItem*save = walk;
		walk = walk->next;
		fn(save, param);
	}
}

void ClearList(List* list, ListItemFn fn) {
	ListItem* walk = list->head;

	while (walk) {
		ListItem* save = walk;
		walk = walk->next;
		if (fn) {
			fn(save, NULL);
		}
		free(save);
	}

	list->head = NULL;
	list->tail = NULL;
	list->size = 0;
}

ListItem* FindFromListHead(List* list, ListItemCmpFn cmp, const void* sample) {
	ListItem* walk = list->head;
	while (walk) {
		if (cmp(walk, sample))
			return walk;
		walk = walk->next;
	}
	return NULL;
}

ListItem* FindFromListTail(List* list, ListItemCmpFn cmp, const void* sample) {
	ListItem* walk = list->tail;
	while (walk) {
		if (cmp(walk, sample))
			return walk;
		walk = walk->prev;
	}
	return NULL;
}

ListItem* RemoveFromList(List* list, ListItem* item) {
	if (!list || !item) {
		return NULL;
	}
	if (item->next) {
		item->next->prev = item->prev;
	} else if (list->tail == item) {
		list->tail = item->prev;
	} else {
		assert(0);
	}
	if (item->prev) {
		item->prev->next = item->next;
	} else if (list->head == item) {
		list->head = item->next;
	} else {
		assert(0);
	}
	list->size--;
	item->next = NULL;
	item->prev = NULL;
	return item;
}

int AddToSet(IntSet* set, int a) {
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

int PeekSet(IntSet* set, int a) {
	int i;
	for (i = 0; i < set->ctr; i++) {
		if (set->values[i] == a) {
			return 1;
			break;
		}
	}
	return 0;
}

int PopSet(IntSet* set) {
	if (set->ctr == 0)
		return 0;
	set->ctr--;
	return set->values[set->ctr];
}

int RemoveFromSet(IntSet* set, int a) {
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

void AddToVarList(List* stack, char* dest, char* src, int reg) {
	VarListItem* var = (VarListItem*)calloc(1, sizeof(VarListItem));
	var->dest = dest;
	var->src = src;
	var->reg = reg;
	AddToList(stack, (ListItem*)var);
}

void ClearVarListItem(VarListItem* item, void* dummy) {
	if (item) {
		free(item->src);
		item->src = NULL;
		free(item->dest);
		item->dest = NULL;
	}
}
