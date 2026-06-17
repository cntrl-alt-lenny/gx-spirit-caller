/* func_0201f6d0: sibling of 02020188 (different fnptr). */
extern int func_0201f0e4(int n);
extern int func_0201f700(void);
extern int func_0209f128(int (*fn)(void));
extern void func_0201f148(void);

int func_0201f6d0(void) {
    func_0201f0e4(3);
    if (func_0209f128(func_0201f700) == 2) return 1;
    func_0201f148();
    return 0;
}
