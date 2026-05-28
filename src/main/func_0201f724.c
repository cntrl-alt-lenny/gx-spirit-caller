/* func_0201f724: sibling of 02020188 (different fnptr). */
extern int func_0201f138(int n);
extern int func_0201f754(void);
extern int func_0209f21c(int (*fn)(void));
extern void func_0201f19c(void);

int func_0201f724(void) {
    func_0201f138(3);
    if (func_0209f21c(func_0201f754) == 2) return 1;
    func_0201f19c();
    return 0;
}
