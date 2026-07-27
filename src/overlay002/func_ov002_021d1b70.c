/* func_ov002_021d1b70: retry loop querying func_ov002_0229cd44 vs a saved
 * field, driven by func_ov002_0229cd54; clears ce950.f_80c on exit. */
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern void func_ov002_0229cd50(void);
extern int func_ov002_0229cd54(void);
extern void func_ov002_0229cd4c(void);
extern u16 *func_ov002_0229cd44(void);

void func_ov002_021d1b70(void) {
    u16 f2 = *(u16 *)(data_ov002_022ce950 + 2);
    func_ov002_0229cd50();
    if (func_ov002_0229cd54() != 0) goto shared;
    for (;;) {
        u16 *p;
        func_ov002_0229cd4c();
        p = func_ov002_0229cd44();
        if (p[0] == 0x63) {
            p = func_ov002_0229cd44();
            if (f2 == p[1]) {
                *(int *)(data_ov002_022ce950 + 0x80c) = 0;
                return;
            }
        }
        if (func_ov002_0229cd54() != 0) break;
    }
shared:
    func_ov002_0229cd50();
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
