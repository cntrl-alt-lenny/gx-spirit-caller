typedef struct Node Node;
struct Node {
    char _0[0x14];
    unsigned char flags;
    char _15[7];
    unsigned int time;
    Node *next;
};
typedef struct List { Node *head; Node *tail; int count; } List;
typedef struct Object Object;
struct Object {
    char _0[8];
    List list;
    char _14[0x30];
    void (*cb)(Object *, int, Node *, int);
    int arg;
};
extern unsigned char data_02101d20[];
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
extern void func_0206880c(Node *node, unsigned char *text);
extern int func_02055330(void);
extern int func_02068380(List *list, Node *key);
void func_02067e94(Object *o, Node *node, unsigned char *text, int len) {
    int found = func_020ab0c4(text, data_02101d20) != 0;
    func_0206880c(node, text);
    if (!found) return;
    if (node->flags & 4) node->flags |= 0x41;
    else node->flags |= 0x42;
    node->flags &= 0xf3;
    node->time = func_02055330() - node->time;
    func_02068380(&o->list, node);
    o->cb(o, 0, node, o->arg);
}
