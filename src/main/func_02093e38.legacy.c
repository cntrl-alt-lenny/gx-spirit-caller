extern void func_02093c20(void *a0, void *a1, int a3, int flag);
extern void func_02093dc8(void *a0);
extern void func_020906dc(void *a0, void (*a4)(void *), void *a5);
extern void func_01ff8770(void *a0, void *a1, void *a2, unsigned int flags);

void func_02093e38(void *a0, void *a1, void *a2, int a3, void (*a4)(void *), void *a5) {
    func_02093c20(a0, a1, a3, 0);

    if (a3 == 0) {
        if (a4 == 0) {
            return;
        }
        a4(a5);
        return;
    }

    func_02093dc8(a0);
    if (a4 != 0) {
        func_020906dc(a0, a4, a5);
        func_01ff8770(a0, a1, a2, ((unsigned int)a3 >> 2) | 0xC4000000);
        return;
    }
    func_01ff8770(a0, a1, a2, ((unsigned int)a3 >> 2) | 0x84000000);
}
