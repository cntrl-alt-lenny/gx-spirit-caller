typedef struct Node Node;
typedef struct Context Context;
struct Node { Node *prev, *next; Context *ctx; volatile unsigned flags; int type, result; char queue[1]; };
struct Context { char pad[0x1c]; volatile unsigned flags; Node head; char pad2[0x54 - 0x20 - sizeof(Node)]; void (*callback)(Node *, int); unsigned callbackFlags; };
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02096728(void *, int);
extern void func_02091a8c(void *);
extern int func_02097a04(Node *);
extern void func_02097a4c(Node *);
int func_02097848(Node *self, int type) {
    Context *ctx = self->ctx;
    int mask = 1 << type;
    int irq;
    Node *head, *cur, *next;
    int active;
    self->type = type;
    self->result = 2;
    self->flags |= 1;
    irq = OS_DisableIrq();
    if (ctx->flags & 0x80) {
        func_02096728(self, 3);
        OS_RestoreIrq(irq);
        return 0;
    }
    head = &ctx->head;
    if (mask & 0x1fc) self->flags |= 4;
    cur = self->prev;
    next = self->next;
    if (cur) cur->next = next;
    if (next) next->prev = cur;
    cur = head;
    next = cur->next;
    while (next) { cur = next; next = next->next; }
    cur->next = self;
    self->prev = cur;
    self->next = 0;
    active = 0;
    if (ctx->flags & 8) active = 1;
    if (!active && !(ctx->flags & 0x10)) {
        ctx->flags |= 0x10;
        OS_RestoreIrq(irq);
        if (ctx->callbackFlags & 0x200) ctx->callback(self, 9);
        irq = OS_DisableIrq();
        self->flags |= 0x40;
        active = (self->flags & 4) ? 1 : 0;
        if (!active) {
            OS_RestoreIrq(irq);
            func_02097a4c(self);
            return 1;
        }
        OS_RestoreIrq(irq);
    } else {
        active = (self->flags & 4) ? 1 : 0;
        if (!active) {
            OS_RestoreIrq(irq);
            return 1;
        }
        do { func_02091a8c(self->queue); } while (!(self->flags & 0x40));
        OS_RestoreIrq(irq);
    }
    return func_02097a04(self);
}





