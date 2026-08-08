extern void func_02045744(void);
extern int func_02045570(void);
extern int func_0203cb90(void);
extern void func_0204525c(int a0, int a1);
extern void func_02045618(void);

int func_0204550c(void) {
    unsigned int v;
    func_02045744();
    if (func_02045570() == 0) {
        goto ret0;
    }
    v = func_0203cb90();
    if (v > 0x63) {
        v = 0x63;
    }
    func_0204525c(8, 0xffff2d10 - v);
    func_02045618();
    return 1;
ret0:
    return 0;
}
