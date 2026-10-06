typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
} obj_02033864_t;

extern int func_02046ae0(void);
extern int func_02046ba8(void);

int func_02033864(obj_02033864_t *o) {
    int r;

    if (o->flags & 0x10000) {
        return 0;
    }
    if (func_02046ae0() > 1) {
        o->flags |= 0x10000;
    }
    r = func_02046ba8();
    if (r != 0) {
        o->flags &= ~0x10000;
    }
    return r;
}
