extern int func_02073dc8(unsigned int v);
extern int func_02073750(void);
extern int func_02073650(int v);
extern int func_02073e9c(void *p, int v);
extern int func_02073014(void *p, int v, int a2, int a3, unsigned int combined, int flag);

int func_0207283c(void *self, void *out, int a2) {
    unsigned short hc = *(unsigned short *)((char *)self + 0xc);
    unsigned short he = *(unsigned short *)((char *)self + 0xe);
    unsigned short sc = (hc >> 8) | (hc << 8);
    unsigned short se = (he >> 8) | (he << 8);
    unsigned int combined = ((unsigned int)sc << 16) | se;
    int result;

    result = func_02073dc8(combined);
    if (result == 0) {
        return result;
    }
    if (func_02073750() == 0) {
        return func_02073650(result);
    }
    {
        int v3;
        unsigned short hc2, he2, sc2, se2;
        unsigned int combined2;

        *(char *)out = 0;
        *(short *)((char *)out + 2) = 0;
        v3 = func_02073e9c(out, a2);
        v3 = (v3 >> 8) | (v3 << 8);
        *(short *)((char *)out + 2) = (short)v3;

        hc2 = *(unsigned short *)((char *)self + 0xc);
        he2 = *(unsigned short *)((char *)self + 0xe);
        sc2 = (hc2 >> 8) | (hc2 << 8);
        se2 = (he2 >> 8) | (he2 << 8);
        combined2 = ((unsigned int)sc2 << 16) | se2;
        return func_02073014(out, a2, 0, 0, combined2, 1);
    }
}
