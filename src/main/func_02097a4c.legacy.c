typedef struct Context Context;
typedef struct Container { void *head; void *f04; } Container;
typedef struct Obj Obj;
typedef Obj Node;
struct Obj {
    int pad0[2];
    Context *state;
    unsigned int flags;
    int type;
    int result;
    Container queue;
};
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02091a0c(Container *c);
extern int func_020965ac(Obj *obj, int index);
extern Node *func_02097af0(Context *self);

static inline int is_async(Obj *obj) { if (obj->flags & 4) return 1; else return 0; }

void func_02097a4c(Obj *self) {
    Context *ctx = self->state;
    int irq;
    if (!self) return;
    do {
        irq = OS_DisableIrq();
        self->flags |= 0x40;
        if (is_async(self) != 0U) {
            func_02091a0c(&self->queue);
            OS_RestoreIrq(irq);
            return;
        }
        self->flags |= 8;
        OS_RestoreIrq(irq);
        if (func_020965ac(self, self->type) == 6) return;
        self = func_02097af0(ctx);
    } while (self);
}

