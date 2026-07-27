/* func_ov002_0220c3c4: bail if arg1==0; else self->b0 (bit0 at +2) picks a
 * per-player row, self's +2 halfword ALSO carries a 5-bit field (bits 1-5)
 * used as a row-table stride index; bail if that u16 entry is zero; else
 * read a 9-bit field (bits 6-14) out of self->+4 and forward (arg1, that
 * field) to the sink. */
extern char data_ov002_022cf1a0[];
extern int func_ov002_021b86f4(int a, int b);

struct F2Bits { unsigned short b0 : 1; unsigned short f1_5 : 5; };
struct F4Bits { unsigned short _pad : 6; unsigned short f2_9 : 9; };

int func_ov002_0220c3c4(void *self, int arg1) {
    struct F2Bits *f2;
    struct F4Bits *f4;
    int idx;
    unsigned short val;
    if (arg1 == 0)
        return 0;
    f2 = (struct F2Bits *)((char *)self + 2);
    idx = (f2->b0 & 1) * 0x868;
    val = *(unsigned short *)(data_ov002_022cf1a0 + idx + f2->f1_5 * 20);
    if (val == 0)
        return 0;
    f4 = (struct F4Bits *)((char *)self + 4);
    return func_ov002_021b86f4(arg1, f4->f2_9);
}
