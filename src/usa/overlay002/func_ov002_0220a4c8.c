/* func_ov002_0220a4c8: 0x100-band 021ca2b8 predicate — require 021c23ac, a
 * 021ff2b8 count over a 021bc288-dependent threshold, 021ca2b8, two 021c2f24
 * queries clear, and a third set -> 2. */

struct Func0220a5b8F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};

struct Func0220a5b8Self {
    unsigned short pad0;
    struct Func0220a5b8F2 f2;
};

extern int func_ov002_021c22cc(unsigned int bit, unsigned int field5);
extern int func_ov002_021ff1c8(struct Func0220a5b8Self *self, unsigned int bit);
extern int func_ov002_021bc1a8(unsigned int bit, unsigned int field5);
extern int func_ov002_021ca1d8(unsigned int bit);
extern int func_ov002_021c2e44(unsigned int bit, int code);

int func_ov002_0220a4c8(struct Func0220a5b8Self *self) {
    int n, m;
    if (func_ov002_021c22cc(self->f2.bit0, self->f2.field5) == 0)
        return 0;
    n = func_ov002_021ff1c8(self, self->f2.bit0);
    m = (func_ov002_021bc1a8(self->f2.bit0, self->f2.field5) == 0);
    if (n < m + 2)
        return 0;
    if (func_ov002_021ca1d8(self->f2.bit0) == 0)
        return 0;
    if (func_ov002_021c2e44(self->f2.bit0, 0x189E) == 0)
        return 0;
    if (func_ov002_021c2e44(self->f2.bit0, 0x18A0) == 0)
        return 0;
    if (func_ov002_021c2e44(self->f2.bit0, 0x189F) != 0)
        return 2;
    return 0;
}
