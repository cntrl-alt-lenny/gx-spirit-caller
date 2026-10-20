typedef struct list_node { struct list_node *prev; struct list_node *next; } list_node_t;
typedef struct Node {
    list_node_t link;
    int f8;
    unsigned int used : 1;
    unsigned int locked : 1;
    unsigned int skip : 1;
    unsigned int refs : 9;
    unsigned int addr : 20;
    int f10;
} Node;
typedef struct { signed char type; char pad[11]; unsigned int size; char pad10[8]; unsigned int addr; } Query;
typedef struct { unsigned int start, end; } Range;
typedef struct { char pad[0x1900]; Node *buckets[3]; Node *list; Node *other; unsigned int count; Range ranges[3]; } Globals;
extern Globals data_0218cbc8;
extern int List_Unlink(list_node_t *node);
/* The assembly implementation accepts value, destination and byte count. */
extern void Fill32();
extern void func_02010eb4(void);
int func_02010040(void *arg, Node *node, int kind) {
    Query *q = 0;
    Globals *g = &data_0218cbc8;
    void *other = 0;
    Node **head;
    if (arg == 0) return 0;
    if (node == 0) return 0;
    if (node->refs != 0) node->refs--;
    if (node->refs != 0) return 1;
    if (node->locked != 0) return 1;
    switch (kind) {
    case 0: q = arg; break;
    case 1: other = arg; break;
    default: return 0;
    }
    if (q != 0) {
        if (q->type == 5) head = &g->list;
        else {
            int found = -1;
            unsigned int i;
            for (i = 0; i < g->count; i++) {
                if (q->addr >= g->ranges[i].start && q->addr + q->size <= g->ranges[i].end) {
                    found = i;
                    break;
                }
            }
            if (found < 0) {
                func_02010eb4();
                for (;;) {}
            }
            head = &g->buckets[found];
        }
    } else if (other != 0) head = &g->other;
    if (*head == node) *head = (Node *)node->link.prev;
    List_Unlink(&node->link);
    Fill32(0, node, 0x14);
    return 1;
}

