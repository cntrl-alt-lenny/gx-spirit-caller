/* func_0206db90: early-out if a0==0. Otherwise re-init a0+0x20, disable
 * IRQ, walk the a0 list via func_020923d8's out-param, firing
 * func_02092484/func_0206beec per node with a field_8 payload, then
 * restore IRQ. */
extern void func_02091a0c(void *p);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020915e0(void);
extern int func_020923d8(void *a0, void **out, int kind);
extern void func_02092484(int a, int b, int c);
extern void func_0206beec(void *node);
extern void func_020915a8(void);
extern void func_020918a4(void);

void func_0206db90(void *a0) {
    int saved;
    void *node;
    if (a0 == 0) {
        return;
    }
    func_02091a0c((char *)a0 + 0x20);
    saved = OS_DisableIrq();
    func_020915e0();
    if (func_020923d8(a0, &node, 0) != 0) {
        do {
            if (node != 0) {
                int f8 = *(int *)((char *)node + 8);
                if (f8 != 0) {
                    func_02092484(f8, -11, 0);
                }
                func_0206beec(node);
            }
        } while (func_020923d8(a0, &node, 0) != 0);
    }
    func_020915a8();
    func_020918a4();
    OS_RestoreIrq(saved);
}
