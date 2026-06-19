/* func_ov018_021ad040: tone-shift a run of `count` RGB555 cells (low half of
 * `packed` = count, high half = scale). Pass 1 decomposes each source cell via
 * func_ov018_021acd90 and tracks the minimum of its third component. Pass 2
 * re-decomposes, knocks (min*scale)>>8 off that component, recombines via
 * func_ov018_021acea8, and writes the result to dst.
 */

extern void func_ov018_021acd90(int value, int *out0, int *out1, int *out2);
extern int func_ov018_021acea8(int a, int b, int c);

void func_ov018_021ad040(unsigned short *src, unsigned short *dst, unsigned int packed) {
    int c0;
    int c1;
    int c2;
    int i;
    int min = 0x100;
    int count = (unsigned short)packed;
    unsigned short *q;
    int scale = (unsigned short)(packed >> 16);
    int prod;

    q = src;
    for (i = 0; i < count; i++) {
        func_ov018_021acd90(*q, &c0, &c1, &c2);
        if (c2 < min) {
            min = c2;
        }
        q++;
    }
    prod = min * scale;
    for (i = 0; i < count; i++) {
        func_ov018_021acd90(*src, &c0, &c1, &c2);
        c2 -= prod >> 8;
        *dst = func_ov018_021acea8(c0, c1, c2);
        src++;
        dst++;
    }
}
