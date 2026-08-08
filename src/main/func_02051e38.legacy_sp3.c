extern int func_02045280(void);
extern char *func_020498f0(void);
extern int func_020469b4(void);

int func_02051e38(void) {
    if (func_02045280() != 0) {
        return 0;
    }
    if (func_020498f0() == 0) {
        goto ret0;
    }
    if (func_020469b4() != 5) {
        goto ret0;
    }
    if (*(unsigned char *)(func_020498f0() + 0x1a9) == 0) {
        goto ret1;
    }
ret0:
    return 0;
ret1:
    return 1;
}
