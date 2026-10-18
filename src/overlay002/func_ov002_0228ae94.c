typedef struct {
    unsigned short w0;
    unsigned short w2_0 : 1;
    unsigned short w2_1 : 15;
    unsigned short w4;
    unsigned short w6_0 : 8;
    unsigned short w6_1 : 8;
} S;

extern int func_0202b878(int id);
extern int func_ov002_0223de94(void *, int);
extern int func_ov002_022575c8(void *, int, int);

int func_ov002_0228ae94(S *a, S *b)
{
    if (b == 0) {
        return 0;
    }
    if (b->w2_0 == a->w2_0) {
        return 0;
    }
    if (func_0202b878(b->w0) != 0x16) {
        return 0;
    }
    if (b->w6_0 == 1) {
        if ((unsigned char)((unsigned short)func_ov002_0223de94(b, 0) >> 8) <= 10) {
            int v = func_ov002_0223de94(b, 0);
            unsigned char hi = (unsigned short)v >> 8;
            unsigned char lo = v;
            if (lo == a->w2_0) {
                if (func_ov002_022575c8(a, lo, hi) != 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
