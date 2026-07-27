/* func_ov002_02221f78: bail if self1's +0xc u16 is zero; else OR 4 into
 * self2->f_4, forward self2's f_2 bit0/bits[1:5] and the just-updated
 * f_4's bits[6:14] to one sink, then forward self1 plus the same f_2
 * fields (re-read) to a second sink. Always returns 0. */
struct Self2 {
    unsigned short f0;
    unsigned short f_2;
    unsigned short f_4;
};
struct F2Bits { unsigned short b0 : 1; unsigned short f1_5 : 5; };
struct F4Bits { unsigned short _pad : 6; unsigned short f2_9 : 9; };

extern int func_ov002_021d8814(int a, int b, int c);
extern int func_ov002_021de3c0(void *self1, int a, int b);

int func_ov002_02221f78(void *self1, struct Self2 *self2) {
    struct F2Bits *f2b = (struct F2Bits *)&self2->f_2;
    struct F4Bits *f4b = (struct F4Bits *)&self2->f_4;
    if (*(unsigned short *)((char *)self1 + 0xc) == 0)
        return 0;
    self2->f_4 = self2->f_4 | 4;
    func_ov002_021d8814(f2b->b0, f2b->f1_5, f4b->f2_9);
    func_ov002_021de3c0(self1, f2b->b0, f2b->f1_5);
    return 0;
}
