typedef struct {
    char pad0[0xce];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
} Obj;

int func_02023eb8(Obj *o) {
    volatile unsigned int *r = (volatile unsigned int *)0x4000000;
    unsigned int f;
    if (o->b0 && o->b1) {
        f = (*r & 0x1f00) >> 8;
        *r = (*r & ~0x1f00) | ((f | 1) << 8);
    } else {
        f = (*r & 0x1f00) >> 8;
        *r = (*r & ~0x1f00) | ((f & 1) << 8);
    }
    return 1;
}
