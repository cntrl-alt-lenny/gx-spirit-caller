/* func_ov023_021b22e4 (ov023) - straight-line shutdown/init call sequence.
 * Four void calls, then func_020071a4(4, 1, &func_ov004_021d6ed0).
 * Returns 1. r2 = literal address of func_ov004_021d6ed0 (a callback ptr). */
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern void func_020071a4(int a0, int a1, void *cb);
extern void func_ov004_021d6ed0(void);

int func_ov023_021b22e4(void) {
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    func_020071a4(4, 1, (void *)func_ov004_021d6ed0);
    return 1;
}
