/* func_0206dc04: early-out if a0==0. Otherwise re-init a0+0x20, disable
 * IRQ, walk the a0 list via func_020924c0's out-param, firing
 * func_0209256c/func_0206bf60 per node with a field_8 payload, then
 * restore IRQ. */
extern void func_02091af4(void *p);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020916c8(void);
extern int func_020924c0(void *a0, void **out, int kind);
extern void func_0209256c(int a, int b, int c);
extern void func_0206bf60(void *node);
extern void func_02091690(void);
extern void func_0209198c(void);

void func_0206dc04(void *a0) {
    int saved;
    void *node;
    if (a0 == 0) {
        return;
    }
    func_02091af4((char *)a0 + 0x20);
    saved = OS_DisableIrq();
    func_020916c8();
    if (func_020924c0(a0, &node, 0) != 0) {
        do {
            if (node != 0) {
                int f8 = *(int *)((char *)node + 8);
                if (f8 != 0) {
                    func_0209256c(f8, -11, 0);
                }
                func_0206bf60(node);
            }
        } while (func_020924c0(a0, &node, 0) != 0);
    }
    func_02091690();
    func_0209198c();
    OS_RestoreIrq(saved);
}
