typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
} obj_020338b8_t;

extern int func_02046ae0(void);
extern int func_02033864(obj_020338b8_t *o);

int func_020338b8(obj_020338b8_t *o) {
    if (func_02046ae0() > 1) {
        func_02033864(o);
    }
    o->flags &= ~0x2000;
    o->flags &= ~0x1000;
    o->flags &= ~0x4000;
    o->flags &= ~0x10000;
    o->flags &= ~0x40000;
    return 0;
}
