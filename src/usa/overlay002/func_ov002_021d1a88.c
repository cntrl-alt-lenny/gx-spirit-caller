/* func_ov002_021d1a88: retry loop querying func_ov002_0229cc34 vs a saved
 * field, driven by func_ov002_0229cc44; clears ce950.f_80c on exit. */
typedef unsigned short u16;
extern char data_ov002_022ce870[];
extern void func_ov002_0229cc40(void);
extern int func_ov002_0229cc44(void);
extern void func_ov002_0229cc3c(void);
extern u16 *func_ov002_0229cc34(void);

void func_ov002_021d1a88(void) {
    u16 f2 = *(u16 *)(data_ov002_022ce870 + 2);
    func_ov002_0229cc40();
    if (func_ov002_0229cc44() != 0) goto shared;
    for (;;) {
        u16 *p;
        func_ov002_0229cc3c();
        p = func_ov002_0229cc34();
        if (p[0] == 0x63) {
            p = func_ov002_0229cc34();
            if (f2 == p[1]) {
                *(int *)(data_ov002_022ce870 + 0x80c) = 0;
                return;
            }
        }
        if (func_ov002_0229cc44() != 0) break;
    }
shared:
    func_ov002_0229cc40();
    *(int *)(data_ov002_022ce870 + 0x80c) = 0;
}
