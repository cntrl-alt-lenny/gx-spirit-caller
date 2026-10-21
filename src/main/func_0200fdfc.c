typedef unsigned int u32;
typedef struct Node Node;
struct Node {
    Node *next, *prev;
    int value;
    u32 used:1;
    u32 locked:1;
    u32 skip:1;
    u32 refs:9;
    u32 addr:20;
    u32 size;
};
typedef struct { signed char type; char pad[7]; int value; u32 size; char pad10[8]; u32 addr; } Query;
typedef struct { int value; u32 size, addr; } Other;
typedef struct { u32 start,end; } Range;
typedef struct { Node pools[5][64]; Node *heads[3]; Node *special; Node *other; u32 count; Range ranges[3]; } Globals;
extern Globals data_0218cbc8;
/* Fill32's assembly definition has a placeholder void signature; it accepts three arguments. */
extern void Fill32(u32 value, void *dest, u32 size);
extern Node *func_0200fa90(Node *n, Node *at);
extern void func_02010eb4(void);
static inline int findRange(Globals *g, Query *q) {
    u32 i;
    int found = -1;
    for (i=0; i<g->count; i++) {
        if (q->addr >= g->ranges[i].start && q->addr + q->size <= g->ranges[i].end) {
            found=i;
            break;
        }
    }
    if (found < 0) { func_02010eb4(); for (;;) {} }
    return found;
}
static inline Node *findSlot(Node *pool) {
    int i;
    for(i=0;i<64;i++) {
        if(pool[i].used==0) return &pool[i];
    }
    return 0;
}
int func_0200fdfc(void *arg, Node *node, int kind, int locked, int skip) {
    Query *q = 0;
    Globals *g = &data_0218cbc8;
    Other *other = 0;
    Node *pool;
    Node **head;
    int value;
    u32 addr, size;
    switch (kind) {
    case 0: q = arg; break;
    case 1: other = arg; break;
    default: return 0;
    }
    if (node != 0) {
        if (q != 0) q->addr = node->addr;
        else other->addr = node->addr;
    } else {
        if (q != 0) {
            if (q->type == 5) {
                pool = g->pools[3];
                head = &g->special;
            } else {
                int found = findRange(g,q);
                pool = g->pools[found];
                head = &g->heads[found];
            }
            value=q->value;
            addr=q->addr;
            size=q->size;
        } else if (other != 0) {
            size=other->size;
            value=other->value;
            addr=other->addr;
            pool=g->pools[4];
            head=&g->other;
            if (size < 16) size=16;
        }
        node=findSlot(pool);
        if (node == 0) return 0;
        Fill32(0,node,20);
        node->value=value;
        node->used=1;
        node->addr=addr;
        node->size=size;
        node->locked=locked;
        node->skip=skip;
        if (*head == 0) *head=node;
        if (node->addr < (*head)->addr) {
            (*head)->prev=node;
            node->next=*head;
            *head=node;
        } else func_0200fa90(node,*head);
    }
    node->refs++;
    return 1;
}


