extern void func_02001ef4(void *p, int x, int y);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);
extern int func_02003b18(void);
extern int func_02003ac0(void);

void func_02004fe8(void *a, int b, int c, int d, int e, int f) {
    func_02001ef4(a, 0, 0);
    func_02004ef4((int)a, b, c, d + 1, e + 1, f, func_02003b18);
    func_02001ef4(a, 1, 1);
    func_02004ef4((int)a, b, c, d, e, f, func_02003ac0);
}
