extern int func_ov002_0223dda4(void *self, int idx);
extern int func_ov002_021b3538(int lo, int hi);
extern int func_ov002_021c1e10(void *self, int a1, int a2);
extern int func_ov002_021b39e0(int lo, int hi, int a1, int a2);

int func_ov002_02241008(void *self, int a1, int a2) {
    int lo, hi;
    int r;
    unsigned short v16;
    unsigned short packed;
    int m1, m2;

    lo = func_ov002_0223dda4(self, 0) & 0xff;
    v16 = (unsigned short)func_ov002_0223dda4(self, 0);
    hi = (v16 >> 8) & 0xff;

    r = func_ov002_021b3538(lo, hi);

    if (!func_ov002_021c1e10(self, a1, a2)) {
        return 0;
    }

    if (r == 0xffff) {
        goto ret0;
    }

    m1 = (unsigned char)a1;
    m2 = (unsigned char)a2;
    packed = (unsigned short)(m1 | (m2 << 8));
    if (r == packed) {
        goto ret0;
    }

    if (func_ov002_021b39e0(lo, hi, a1, a2) != 0) {
        return 1;
    }
ret0:
    return 0;
}
