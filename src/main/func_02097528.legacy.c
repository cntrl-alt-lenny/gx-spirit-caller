typedef struct Dev Dev;
typedef struct Node { struct Node *prev; struct Node *next; } Node;
struct Dev {
    char pad[0x1c];
    volatile unsigned int flags;
    int f20;
    Node *head;
    int f28, f2c, f30, f34, f38, f3c;
    volatile int f40;
};
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_020972d4(Dev *dev);
extern int func_02097258(Dev *self);
extern void func_02096728(void *self, int param2);
static inline int acquire(Dev *dev, unsigned int flags) {
    return func_020972d4(dev);
}
int func_02097528(Dev *dev) {
    int irq = OS_DisableIrq();
    int active = (dev->flags & 2) ? 1 : 0;
    if (active != 0) {
        int acquired = acquire(dev, dev->flags);
        Node *node;
        dev->flags |= 0x80;
        node = dev->head;
        while (node != 0) {
            Node *next = node->next;
            func_02096728(node, 3);
            node = next;
        }
        dev->head = 0;
        if (acquired != 0) func_02097258(dev);
        dev->f28 = 0;
        dev->f2c = 0;
        dev->f30 = 0;
        dev->f34 = 0;
        dev->f38 = 0;
        dev->f40 = 0;
        dev->f3c = dev->f40;
        dev->flags &= ~0xa2;
    }
    OS_RestoreIrq(irq);
    return 1;
}
