extern int func_02073eb0(unsigned int v);
extern int func_02073838(void);
extern int func_02073738(int v);
extern int func_02073f84(void *p, int v);
extern int func_020730fc(void *p, int v, int a2, int a3, unsigned int combined, int flag);

int func_02072924(void *self, void *out, int a2) {
    unsigned short hc = *(unsigned short *)((char *)self + 0xc);
    unsigned short he = *(unsigned short *)((char *)self + 0xe);
    unsigned short sc = (hc >> 8) | (hc << 8);
    unsigned short se = (he >> 8) | (he << 8);
    unsigned int combined = ((unsigned int)sc << 16) | se;
    int result;

    result = func_02073eb0(combined);
    if (result == 0) {
        return result;
    }
    if (func_02073838() == 0) {
        return func_02073738(result);
    }
    {
        int v3;
        unsigned short hc2, he2, sc2, se2;
        unsigned int combined2;

        *(char *)out = 0;
        *(short *)((char *)out + 2) = 0;
        v3 = func_02073f84(out, a2);
        v3 = (v3 >> 8) | (v3 << 8);
        *(short *)((char *)out + 2) = (short)v3;

        hc2 = *(unsigned short *)((char *)self + 0xc);
        he2 = *(unsigned short *)((char *)self + 0xe);
        sc2 = (hc2 >> 8) | (hc2 << 8);
        se2 = (he2 >> 8) | (he2 << 8);
        combined2 = ((unsigned int)sc2 << 16) | se2;
        return func_020730fc(out, a2, 0, 0, combined2, 1);
    }
}
