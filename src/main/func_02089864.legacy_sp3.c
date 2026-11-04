typedef struct { void *head, *tail; unsigned short count, offset; } List;
struct Pool { void *heap; char list[0x10]; };
typedef struct Node {
    void *prev, *next;
    int size;
    void (*callback)(void *, int, int, int);
    int arg2, arg3;
    int pad[2];
    char data[1];
} Node;

/* The assembly-only callee takes a list and a previous node and returns a node. */
extern void *func_0207cfc8(void *list, void *node);
extern void func_0207cff4(List *list, void *node);
extern void func_0207da7c(void *p, int flags);
extern int func_02089748(void);
extern int func_02089768(struct Pool *p);

void func_02089864(struct Pool *p)
{
    void *group;
    Node *node;
    int called = 0;
    group = func_0207cfc8(p->list, 0);
    while (group) {
        node = func_0207cfc8(group, 0);
        while (node) {
            if (node->callback) {
                node->callback(node->data, node->size, node->arg2, node->arg3);
                called = 1;
            }
            node = func_0207cfc8(group, node);
        }
        func_0207cff4((List *)p->list, group);
        group = func_0207cfc8(p->list, 0);
    }
    func_0207da7c(p->heap, 3);
    if (called) func_02089748();
    func_02089768(p);
}


