typedef unsigned short u16;
struct S0220472c { u16 b0 : 1; u16 pad : 5; u16 k : 6; };

int func_ov002_0220472c(void *self) {
    struct S0220472c *s = (struct S0220472c *)((char *)self + 2);
    int result;
    if (s->k == 0xf) {
        unsigned int hi = (unsigned)(*(int *)((char *)self + 0x14) << 10) >> 31;
        result = hi != (unsigned)s->b0;
    } else {
        result = 0;
    }
    return result;
}
