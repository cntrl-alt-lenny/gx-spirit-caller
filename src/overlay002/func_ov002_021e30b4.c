extern int func_ov002_021b97d4(int sign, unsigned short lo);
extern int func_ov002_021fd81c(int a, int b, int c);
extern int func_ov002_021e2e80(int a, int b, int c, int d);

int func_ov002_021e30b4(int arg0, int arg1, int arg2) {
    int result;

    if ((arg1 >> 1) == 0) {
        unsigned sign;
        unsigned short lo;
        int r;

        sign = ((unsigned)arg0 & 0x80000000) >> 31;
        lo = (unsigned short)arg0;
        r = func_ov002_021b97d4(sign, lo);
        arg1 = (unsigned short)r;
    }
    result = func_ov002_021fd81c(arg0, arg1, arg2);
    if (result == 0)
        return 0;
    func_ov002_021e2e80(0, arg0, arg1, arg2);
    return 1;
}
