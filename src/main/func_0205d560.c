typedef struct {
    char **lists;
    int count;
} Set;

typedef struct {
    char _pad0[0x428];
    Set *set;
} Owner;

typedef struct {
    int  arg0;
    void (*fn)(int a, int b, int c);
    int  arg2;
} cb_table_0205d5a0_t;

extern void *func_02054338(Set *s, int (*fn)(void *, void *), void *arg);
extern void func_0205d5a0(int x, cb_table_0205d5a0_t *tbl);

int func_0205d560(Owner **pp, void (*fn)(int a, int b, int c), int arg) {
    Owner *o = *pp;
    cb_table_0205d5a0_t tbl;

    tbl.fn = fn;
    tbl.arg2 = arg;
    tbl.arg0 = (int)pp;
    return func_02054338(o->set, (int (*)(void *, void *))func_0205d5a0, &tbl) == 0;
}
