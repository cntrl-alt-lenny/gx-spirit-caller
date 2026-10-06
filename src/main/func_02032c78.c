typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
    char          _pad2[0x48];
    void        (*callback)(int b);
} obj_02032c78_t;

extern int func_020334cc(obj_02032c78_t *o);

void func_02032c78(int a, int b, obj_02032c78_t *o) {
    o->flags &= ~0x200;
    if (func_020334cc(o) != 0) {
        return;
    }
    if (b != 0) {
        o->flags |= 0x100;
    }
    if (o->callback != 0) {
        o->callback(b);
    }
}
