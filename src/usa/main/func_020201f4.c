/* func_020201f4: sibling of 02020188 (different fnptr + helper2). */
extern int func_0201f0e4(int n);
extern int func_02020224(void);
extern int func_0209ef3c(int (*fn)(void));
extern void func_0201f148(void);

int func_020201f4(void) {
    func_0201f0e4(3);
    if (func_0209ef3c(func_02020224) == 2) return 1;
    func_0201f148();
    return 0;
}
