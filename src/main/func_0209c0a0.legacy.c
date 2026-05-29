/* func_0209c0a0: StyleA guard-then-tail -> if c0cc() return it; else tail 93bfc(). */
extern int func_0209c0cc(void);
extern int func_02093bfc(void);
int func_0209c0a0(void) {
    int r = func_0209c0cc();
    if (r != 0) return r;
    return func_02093bfc();
}
