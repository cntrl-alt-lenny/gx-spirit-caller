typedef struct Node Node;
struct Node {
    char pad[0x14];
    unsigned char flags;
    char pad15[7];
    int time;
    Node *next;
};
typedef struct List {
    Node *head;
    Node *tail;
    int count;
} List;
typedef struct Obj Obj;
struct Obj {
    char pad[8];
    List list;
    char pad14[0x30];
    void (*cb)(Obj *, int, Node *, int);
    int arg;
};
extern unsigned char data_02101d20[];
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
extern void func_0206880c(Node *, unsigned char *);
extern int func_02055330(void);
extern int func_02068380(List *list, Node *key);
void func_02067e94(Obj *o, Node *n, unsigned char *p) {
    int found = func_020ab0c4(p, data_02101d20) != 0;
    func_0206880c(n, p);
    if (!found) return;
    if (n->flags & 4) n->flags |= 0x41;
    else n->flags |= 0x42;
    n->flags &= 0xf3;
    n->time = func_02055330() - n->time;
    func_02068380(&o->list, n);
    o->cb(o, 0, n, o->arg);
}
