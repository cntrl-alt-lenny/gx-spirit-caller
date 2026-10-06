typedef struct {
    int a;
    int b;
} Pair;

typedef struct Node Node;
struct Node {
    Pair key;
    int x8;
    int xc;
    int x10;
    Node *next;
};

typedef struct {
    char _pad0[0x438];
    Node *head;
    Node *tail;
} Owner;

typedef struct {
    char _pad0[0x18];
    int x18;
} Src;

extern int func_020453e8(int a);
extern int func_0205ffc0(int *p, int b);
extern char data_021002a4[];

int func_02058528(Owner **pp, Pair key, int a3, Src *src, int a5) {
    Owner *o = *pp;
    Node *n = (Node *)func_020453e8(0x18);

    if (n == 0) {
        func_0205ffc0((int *)pp, (int)data_021002a4);
        return 1;
    }
    n->key = key;
    n->x8 = a3;
    if (src != 0) {
        n->x10 = src->x18;
    } else {
        n->x10 = 0;
    }
    n->xc = a5;
    n->next = 0;
    if (o->head == 0) {
        o->head = n;
    }
    if (o->tail != 0) {
        o->tail->next = n;
    }
    o->tail = n;
    return 0;
}
