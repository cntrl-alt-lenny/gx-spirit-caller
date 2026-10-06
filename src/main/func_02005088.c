extern void func_02001ef4(int a, int b, int c);
extern void func_02003c68(void);
extern void func_02003ac0(void);
extern void func_02004ef4(int a0, int a1, int a2, int a3, int a4, int a5, void *fn);

void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5) {
    func_02001ef4(a0, 2, 2);
    func_02004ef4(a0, a1, a2, a3 - 1, a4 - 1, a5, func_02003c68);
    func_02001ef4(a0, 2, 1);
    func_02004ef4(a0, a1, a2, a3 - 1, a4, a5, func_02003c68);
    func_02001ef4(a0, 2, 0);
    func_02004ef4(a0, a1, a2, a3 - 1, a4 + 1, a5, func_02003c68);
    func_02001ef4(a0, 1, 1);
    func_02004ef4(a0, a1, a2, a3, a4, a5, func_02003ac0);
}
