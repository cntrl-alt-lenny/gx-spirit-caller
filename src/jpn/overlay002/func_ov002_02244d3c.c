extern int func_ov002_0223dda4(void *arg0, int idx);
extern int func_ov002_021bc47c(int a, int b);

int func_ov002_02244d3c(void *arg0, int arg1, int arg2) {
    int packed = func_ov002_0223dda4(arg0, 0);
    int kind = (unsigned char)((unsigned short)packed >> 8);
    if (arg2 > 4) return 0;
    if (arg2 != kind - 1 && arg2 != kind + 1) goto ret0;
    if (func_ov002_021bc47c(arg1, arg2) == 0) return 0;
    return 1;
ret0:
    return 0;
}
