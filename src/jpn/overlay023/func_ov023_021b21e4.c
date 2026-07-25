/* func_ov023_021b21e4 (ov023) - straight-line shutdown/init call sequence.
 * Four void calls, then func_02007188(4, 1, &func_ov004_021d6de4).
 * Returns 1. r2 = literal address of func_ov004_021d6de4 (a callback ptr). */
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern void func_02007188(int a0, int a1, void *cb);
extern void func_ov004_021d6de4(void);

int func_ov023_021b21e4(void) {
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    func_02007188(4, 1, (void *)func_ov004_021d6de4);
    return 1;
}
