typedef struct Node {
    struct Node *next;
    struct Node *prev;
    int f8;
    unsigned int used : 1;
    unsigned int locked : 1;
    unsigned int skip : 1;
    unsigned int refs : 9;
    unsigned int addr : 20;
    unsigned int size;
} Node;
typedef struct { int f0; unsigned int size; } Query;
typedef struct { char pad[0x910]; Node *head; } Heads;
typedef struct { char pad[0x1930]; unsigned int start, end; } Globals;
extern Heads data_0218dbc8;
extern Globals data_0218cbc8;
unsigned int func_02010354(Query *q) {
    Globals *g;
    Node *node;
    Node *next;
    unsigned int start;
    unsigned int size;
    node = data_0218dbc8.head;
    g = &data_0218cbc8;
    if (node == 0) return g->start;
    start = g->start;
    size = q->size;
    if (size <= node->addr - start) goto found;
    next = node->next;
    while (next != 0) {
        start = node->addr + node->size;
        if (size <= next->addr - start) goto found;
        node = next;
        next = next->next;
    }
    start = node->addr + node->size;
    if (size > g->end - start) return 0x80000;
found:
    if (start & 0xf) start = (start + 0xe) & ~0xf;
    return start;
}


