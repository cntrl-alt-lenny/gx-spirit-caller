typedef struct Teardown {
    char pad0[8];
    void *f8;
    int fC;
    char pad10[8];
    void *f18;
    char pad1C[12];
    void *f28;
    char pad2C[12];
    char *f38;
    struct Teardown *next;
} Teardown;
typedef struct { char pad[0x434]; Teardown *head; } State;
typedef struct { State *state; } Context;
typedef struct { int base; int pad[3]; int kind; int offset; } Item;
struct Self02053e58;
extern void func_02053e58(struct Self02053e58 *self, int idx);
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern int func_02056c34(void *p, int a, int b, int c);
extern void func_0205cab4(void *unused, Teardown *p);
extern void func_020604a4(int a, ...);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100b54[], data_02100b64[], data_02100c68[], data_02100c6c[];
void func_0205c9a0(Context *ctx, Teardown *node) {
    State *state = ctx->state;
    Teardown *prev;
    Teardown *cur;
    Item *item;
    if (node == 0)
        func_020a6d54((int)data_02100b54, (int)data_02100b64, 0, 0x213);
    prev = state->head;
    if (prev == node) {
        state->head = node->next;
    } else {
        cur = prev->next;
        while (cur != node) {
            if (cur == 0) {
                func_020a6d54((int)data_02100c68, (int)data_02100b64, 0, 0x225);
                func_020604a4((int)ctx, data_02100c6c);
                return;
            }
            prev = cur;
            cur = cur->next;
        }
        prev->next = node->next;
    }
    while (func_02054140(node->f38) != 0) {
        item = func_020540d0(node->f38, 0);
        if (item->kind < 100)
            func_02056c34(ctx, node->fC, item->kind, item->base + item->offset);
        func_02053e58((struct Self02053e58 *)node->f38, 0);
    }
    func_0205cab4(ctx, node);
}
