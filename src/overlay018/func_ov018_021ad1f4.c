/* func_ov018_021ad1f4: brighten a run of `count` RGB555 cells (twin of
 * func_ov018_021ad118; low half of `packed` = count, high half = scale). Pass 1
 * finds the maximum headroom (min of the third component vs 0x200). Pass 2
 * re-decomposes each cell, lifts that component by ((0x200-min)*scale)>>8,
 * clamps to 0x1ff, recombines via func_ov018_021acf80, and writes to dst.
 */

extern void func_ov018_021ace68(int value, int *out0, int *out1, int *out2);
extern int func_ov018_021acf80(int a, int b, int c);

void func_ov018_021ad1f4(unsigned short *src, unsigned short *dst, unsigned int packed) {
    int c0;
    int c1;
    int c2;
    int i;
    int min = 0x200;
    int count = (unsigned short)packed;
    unsigned short *q;
    int scale = (unsigned short)(packed >> 16);
    int prod;
    int t;

    q = src;
    for (i = 0; i < count; i++) {
        func_ov018_021ace68(*q, &c0, &c1, &c2);
        if (c2 < min) {
            min = c2;
        }
        q++;
    }
    prod = (0x200 - min) * scale;
    for (i = 0; i < count; i++) {
        func_ov018_021ace68(*src, &c0, &c1, &c2);
        t = c2 + (prod >> 8);
        if (t > 0x1ff) {
            t = 0x1ff;
        }
        c2 = t;
        *dst = func_ov018_021acf80(c0, c1, c2);
        src++;
        dst++;
    }
}
