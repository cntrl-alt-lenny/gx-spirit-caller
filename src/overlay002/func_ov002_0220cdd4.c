/* func_ov002_0220cdd4: branch on self+0x2's bits[13:12]. When ==2:
 * gate chain (021ca2b8, 021c3ae4, 021bcd80) then compare 021bbf50's
 * result. Otherwise: return func_ov002_021b422c(self+0x4's bits[14:6],
 * self->f0) > 0.
 */
struct Self0220 {
    unsigned short f0;    /* +0 */
    unsigned short b0 : 1;  /* +2 */
    unsigned short : 11;
    unsigned short twobit : 2;
    unsigned short : 2;
    unsigned short : 6;      /* +4 */
    unsigned short ninebit : 9;
    unsigned short : 1;
};

extern int func_ov002_021ca2b8(int a);
extern int func_ov002_021c3ae4(int a, int b);
extern int func_ov002_021bcd80(int a, int b);
extern int func_ov002_021bbf50(int a);
extern int func_ov002_021b422c(int a, int b);

int func_ov002_0220cdd4(struct Self0220 *self) {
    int last;

    if (self->twobit == 2) {
        if (func_ov002_021ca2b8(self->b0) == 0)
            return 0;
        if (func_ov002_021c3ae4(self->b0, self->f0) == 0)
            return 0;

        last = func_ov002_021bcd80(self->b0, -1);
        if (last != 0) {
            return last == func_ov002_021bbf50(self->b0);
        }
        return 0;
    }

    return func_ov002_021b422c(self->ninebit, self->f0) > 0;
}
