typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
    char          _pad2[0x30];
    void        (*callback)(int b);
} obj_02032ac4_t;

extern int func_020334cc(obj_02032ac4_t *o);
extern void func_020327e4(obj_02032ac4_t *o);

void func_02032ac4(int a, int b, obj_02032ac4_t *o) {
    if (func_020334cc(o) != 0) {
        return;
    }
    o->flags |= 0x1000;
    if (b == 0) {
        o->flags |= 0x2000;
        func_020327e4(o);
    } else {
        o->flags &= ~0x2000;
    }
    if (o->callback != 0) {
        o->callback(b);
    }
}
