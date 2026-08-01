/* func_ov002_022affc0: r0 is never read (unused). field = 2-bit field of
 * data_02104e6c+4 at bit-offset 3. base = (field/2==0) ? 0x10 : 0. If field
 * is even, arg1>=0x18 fails (-1); if odd, arg1<=0xe8 fails (-1). Else scan
 * bit i (0..5) of arg3; for each set bit, return i if arg2 falls in
 * [base,base+0x14); base accumulates data_ov002_022ca400[i] every
 * iteration regardless. Returns -1 if nothing matches. */
extern int data_02104e6c[];
extern const int data_ov002_022ca400[];

int func_ov002_022affc0(int unused0, int arg1, int arg2, int arg3) {
    int field = (unsigned)(*(int *)((char *)data_02104e6c + 4) << 0x1b) >> 0x1e;
    int half = field / 2;
    int base = (half != 0) ? 0 : 0x10;
    if ((field % 2) != 0) {
        if (arg1 <= 0xe8) return -1;
    } else {
        if (arg1 >= 0x18) return -1;
    }
    {
        int i;
        for (i = 0; i < 6; i++) {
            if (arg3 & (1 << i)) {
                if (arg2 >= base && arg2 < base + 0x14) return i;
            }
            base += data_ov002_022ca400[i];
        }
    }
    return -1;
}
