#include "common.h"

#include "output.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void AddOutput(Output ** output, int indent, char *line)
{
    int i;
    Output *newline = (Output*)calloc(1, sizeof(Output));
    Output *walk = *output;
    int lenline = strlen(line);
    newline->line = (char*)calloc(lenline + (indent * 3) + 1, sizeof(char*));
    newline->next = NULL;
    for (i = 0; i < indent * 3; i++)
        newline->line[i] = ' ';
    strncpy(newline->line + (indent * 3), line, lenline + 1);
    if (*output != NULL) {
        for (walk = *output; walk->next != NULL; walk = walk->next);
        walk->next = newline;
    } else {
        *output = newline;
    }
}

static void PrintOutput(Output * output)
{
    for (; output != NULL; output = output->next) {
        printf("%s", output->line);
    }
}
