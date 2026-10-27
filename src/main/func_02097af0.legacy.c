typedef struct Container { void *head; void *f04; } Container;
typedef struct Obj_t {
    int field_0, field_4;
    void *field_8;
    int field_c, field_10;
    char pad14[4];
    int field_18, field_1c;
    char pad20[0x2c];
} Obj_t;
typedef struct Node {
    struct Node *prev, *next;
    int f8;
    volatile unsigned flags;
    int f10, f14;
    Container queue;
} Node;
typedef struct Context {
    char pad0[0x14];
    Container queue;
    volatile unsigned flags;
    int f20;
    Node *head;
    char pad28[0x2c];
    void (*callback)(void *, int);
    unsigned events;
} Context;
/* The IRQ-disable assembly returns the saved mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02091a0c(Container *c);
extern void func_02096728(void *self, int param2);
extern void func_02098388(Obj_t *obj);
Node *func_02097af0(Context *self) {
    Obj_t event;
    Node *node, *next;
    int irq, started;
    irq = OS_DisableIrq();
    if (self->flags & 0x20) {
        self->flags &= ~0x20;
        node = self->head;
        if (node) {
            do {
                next = node->next;
                if ((node->flags & 2) ? 1 : 0) {
                    if (self->head == node) self->head = next;
                    func_02096728(node, 3);
                    if (next == 0) next = self->head;
                }
                node = next;
            } while (next != 0);
        }
    }
    if (!(self->flags & 0x40) && !((self->flags & 8) ? 1 : 0) && (node = self->head) != 0) {
        started = !((self->flags & 0x10) ? 1 : 0);
        if (started) self->flags |= 0x10;
        OS_RestoreIrq(irq);
        if (started && (self->events & 0x200)) self->callback(node, 9);
        irq = OS_DisableIrq();
        node->flags |= 0x40;
        if ((node->flags & 4) ? 1 : 0) {
            func_02091a0c(&node->queue);
            OS_RestoreIrq(irq);
            return 0;
        }
        OS_RestoreIrq(irq);
        return node;
    }
    if (self->flags & 0x10) {
        self->flags &= ~0x10;
        if (self->events & 0x400) {
            func_02098388(&event);
            event.field_8 = self;
            self->callback(&event, 10);
        }
    }
    if (self->flags & 0x40) {
        self->flags &= ~0x40;
        self->flags |= 8;
        func_02091a0c(&self->queue);
    }
    OS_RestoreIrq(irq);
    return 0;
}


