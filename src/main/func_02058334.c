extern int func_020453b4(); /* Original call sites supply only r0, fewer than the four-argument definition. */
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100260[], data_02100280[], data_02100290[];
typedef struct { int x0; int count; void *items; void *xc; void *x10; } Data;
typedef struct { char pad[0x38]; int count; void **a; void **b; } Arrays;
typedef struct Node { void (*callback)(void *, void *, int); int arg; void *data; int kind; } Node;
void func_02058334(void *ctx, Node *n) {
    if (n->callback == 0) func_020a6d54((int)data_02100260, (int)data_02100280, 0, 0x6e);
    if (n->data == 0) func_020a6d54((int)data_02100290, (int)data_02100280, 0, 0x6f);
    n->callback(ctx, n->data, n->arg);
    if (n->kind == 2) {
        func_020453b4((int)((Data *)n->data)->items);
        ((Data *)n->data)->items = 0;
    } else if (n->kind == 3) {
        Arrays *p = n->data;
        int i;
        for (i = 0; i < p->count; i++) {
            func_020453b4((int)p->a[i]);
            p->a[i] = 0;
            func_020453b4((int)p->b[i]);
            p->b[i] = 0;
        }
        func_020453b4((int)p->a);
        p->a = 0;
        func_020453b4((int)p->b);
        p->b = 0;
    } else if (n->kind == 4) {
        Data *p = n->data;
        func_020453b4((int)p->xc);
        p->xc = 0;
    } else if (n->kind == 7) {
        Data *p = n->data;
        if (p->x10 != 0) { func_020453b4((int)p->x10); p->x10 = 0; }
    } else if (n->kind == 8) {
        Data *p = n->data;
        if (p->items != 0) { func_020453b4((int)p->items); p->items = 0; }
    } else if (n->kind == 9) {
        Data *p = n->data;
        int i;
        for (i = 0; i < p->count; i++) {
            func_020453b4((int)((void **)p->items)[i]);
            ((void **)p->items)[i] = 0;
        }
        func_020453b4((int)p->items);
        p->items = 0;
    }
    func_020453b4((int)n->data);
    n->data = 0;
    func_020453b4((int)n);
}
