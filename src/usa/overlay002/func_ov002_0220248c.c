/* func_ov002_0220248c: self's +0x2 halfword carries both an asymmetric
 * 6-bit dispatch field (bits 6-11, must equal 15) and a bit0 flag; guard
 * chain against data_ov002_022cd314 fields, then forward (self, f_0,
 * f_1c) to the accessor-guard sink (matches ov002_core.h's documented
 * func_ov002_021c1e10(self,player,idx) signature exactly), then report
 * whether self->f_14 is nonzero. */
extern char data_ov002_022cd314[];

union F2 {
    unsigned short raw;
    struct { unsigned short b0 : 1; } bits;
};

struct Self {
    unsigned short f0;
    union F2 f2;
    char _pad[0x10];
    int f_14;
};

extern int func_ov002_021c1e10(struct Self *self, int player, int idx);

int func_ov002_0220248c(struct Self *self) {
    int f0;
    if (((unsigned)(self->f2.raw << 20) >> 26) != 15)
        return 0;
    f0 = *(int *)data_ov002_022cd314;
    if (f0 != self->f2.bits.b0)
        return 0;
    if (*(int *)(data_ov002_022cd314 + 8) == 0)
        return 0;
    if (func_ov002_021c1e10(self, f0, *(int *)(data_ov002_022cd314 + 0x1c)) == 0)
        return 0;
    return (unsigned short)self->f_14 != 0;
}
