typedef struct {
    char _pad0[0x100];
    int x100;
} Conn;

typedef struct {
    char _pad0[0x10];
    int buf;
    int refs;
} Entry;

struct S02057730_A0;
struct S02057730_A1;

extern int func_0205d6bc(void **pp, int val, int *out);
extern int func_0205ffc0(int *p, int b);
extern int func_02057730(struct S02057730_A0 *a0, struct S02057730_A1 *a1);
extern int func_020453b4(int a);
extern int func_0205d4c0(void *self);
extern int func_0205d674(int **p, Entry *e);
extern char data_020fff64[];

int func_02056a58(Conn **pp, int key) {
    Conn *c = *pp;
    Entry *e;
    int r;

    if (func_0205d6bc((void **)pp, key, (int *)&e) == 0) {
        func_0205ffc0((int *)pp, (int)data_020fff64);
        return 2;
    }
    if (e->buf == 0) {
        func_0205ffc0((int *)pp, (int)data_020fff64);
        return 2;
    }
    r = func_02057730((struct S02057730_A0 *)pp, (struct S02057730_A1 *)e);
    if (r != 0) {
        return r;
    }
    e->refs--;
    if (c->x100 == 0 && e->refs <= 0) {
        func_020453b4(e->buf);
        e->buf = 0;
        if (func_0205d4c0(e) != 0) {
            func_0205d674((int **)pp, e);
        }
    }
    return 0;
}
