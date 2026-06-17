/* func_0209bfac: StyleA guard-then-tail -> if c0cc() return it; else tail 93bfc(). */
extern int func_0209bfd8(void);
extern int func_02093b08(void);
int func_0209bfac(void) {
    int r = func_0209bfd8();
    if (r != 0) return r;
    return func_02093b08();
}
