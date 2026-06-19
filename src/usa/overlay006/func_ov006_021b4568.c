/* func_ov006_021b4568: C-23 ov006 uniform MMIO family (brief 270 head 021b4d68).
 * guard +8 -> h2; *0x04000540 = (g2<<1)|g3 (gotcha 19 shifted-first); return 1. */
extern void func_02021104(void);
extern void func_0200e9a8(void);
extern int data_020c3d68, data_02103cc0;
extern char data_ov006_0224f170[];
int func_ov006_021b4568(void) {
    func_02021104();
    if (*(int *)(data_ov006_0224f170 + 8) != 0) {
        func_0200e9a8();
        *(int *)0x04000540 = (data_020c3d68 << 1) | data_02103cc0;
    }
    return 1;
}
