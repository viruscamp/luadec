#ifndef OUTPUT_H
#define OUTPUT_H

typedef struct Output_ Output;

struct Output_ {
    char *line;
    Output *next;
};

static void AddOutput(Output ** output, int indent, char *line);

static void PrintOutput(Output * output);

#endif
