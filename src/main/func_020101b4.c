typedef struct Node {
    struct Node *next;
    struct Node *prev;
    int f8;
    unsigned int used : 1; unsigned int locked : 1; unsigned int skip : 1; unsigned int refs : 9; unsigned int addr : 20;
    unsigned int size;
} Node;
typedef struct { signed char type; char pad[11]; unsigned int size; } Query;
typedef struct { unsigned int start, end; } Range;
typedef struct {
    char pad[0x1900];
    Node *buckets[3];
    Node *list;
    Node *other;
    unsigned int count;
    unsigned int ranges[3][2];
    char pad1930[8];
    Range special;
} Globals;
extern Globals data_0218cbc8;
unsigned int func_020101b4(Query *q) {
    Globals *g = &data_0218cbc8;
    Node *node;
    Node *next;
    unsigned int start;
    unsigned int i;
    if (q->type == 5) {
        node = g->list;
        if (node == 0) {
            start = g->special.start;
            if (q->size <= g->special.end - start) return start;
            return 0x80000;
        }
        start = g->special.start;
        if (q->size <= node->addr - start) return start;
        {
            next = node->next;
            while (next != 0) {
                start = node->addr + node->size;
                if (q->size <= next->addr - start) return start;
                node = next;
                next = next->next;
            }
        }
        start = node->addr + node->size;
        if (q->size <= g->special.end - start) return start;
    } else {
        for (i = 0; i < g->count; i++) {
            node = g->buckets[i];

                if (node == 0) {
                start = g->ranges[i][0];
                if (q->size <= g->ranges[i][1] - start) return start;
            } else {
                start = g->ranges[i][0];
                if (q->size <= node->addr - start) return start;
                {
                    next = node->next;
                    while (next != 0) {
                        start = node->addr + node->size;
                        if (q->size <= next->addr - start) return start;
                        node = next;
                        next = next->next;
                    }
                }
                start = node->addr + node->size;
                if (q->size <= g->ranges[i][1] - start) return start;
            }
        }
    }
    return 0x80000;
}







