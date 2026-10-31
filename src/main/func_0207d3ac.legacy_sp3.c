extern int func_020a6d48(int x);
typedef struct Node { unsigned pad0; unsigned size; unsigned pad8; struct Node *next; } Node;
typedef struct { char pad[0x24]; Node *head; } Owner;
unsigned func_0207d3ac(Owner *p, int alignment) {
    unsigned align = func_020a6d48(alignment);
    unsigned best = 0;
    unsigned offset = 0xffffffff;
    Node *n = p->head;
    if (n != 0) {
        unsigned size;
        unsigned adjustment = align - 1;
        unsigned mask = ~adjustment;
        do {
            unsigned base = (unsigned)n + 0x10;
            unsigned start = mask & (adjustment + base);
            unsigned end = n->size + base;
            if (start < end) {
                size = end - start;
                unsigned skip = start - base;
                if (best < size || (best == size && offset > skip)) {
                    best = size;
                    offset = skip;
                }
            }
            n = n->next;
        } while (n != 0);
    }
    return best;
}



