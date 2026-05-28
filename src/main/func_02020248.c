/* func_02020248: sibling of 02020188 (different fnptr + helper2). */
extern int func_0201f138(int n);
extern int func_02020278(void);
extern int func_0209f030(int (*fn)(void));
extern void func_0201f19c(void);

int func_02020248(void) {
    func_0201f138(3);
    if (func_0209f030(func_02020278) == 2) return 1;
    func_0201f19c();
    return 0;
}
