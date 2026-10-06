typedef struct {
    char           _0[0x4];
    void          *handle;
    char           _8[0x21];
    unsigned char  param_29;
    unsigned char  param_2a;
    char           _2b[0x9];
    unsigned int   id;
    char           _38[0x30];
    unsigned short flags;
} ent_020381bc_t;

extern ent_020381bc_t *func_02037b58(int id);
extern void func_02087d7c(void **pp, int mask, int value);
extern void func_02087d54(void **pp, int mask, int value);

int func_020381bc(int id, int a, int b) {
    ent_020381bc_t *e = func_02037b58(id);

    if (e == 0) {
        return 0;
    }
    if (((e->id >> 20) & 0xf) == 4) {
        return 0;
    }
    if (a >= 0) {
        e->param_29 = a;
        if (!(e->flags & 0x6000)) {
            func_02087d7c(&e->handle, 0xffff, a);
        }
    }
    if (b >= 0) {
        e->param_2a = b;
        if (!(e->flags & 0x6000)) {
            func_02087d54(&e->handle, 0xffff, b);
        }
    }
    return 1;
}
