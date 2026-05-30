/* func_ov006_021b2690: C-23 ov006 uniform MMIO family (brief 270 head 021b4d68).
 * guard +8 -> h2; *0x04000540 = (g2<<1)|g3 (gotcha 19 shifted-first); return 1. */
extern void func_02021158(void);
extern void func_0200e9c4(void);
extern int data_020c3e48, data_02103da0;
extern char data_ov006_021cf140[];
int func_ov006_021b2690(void) {
    func_02021158();
    if (*(int *)(data_ov006_021cf140 + 8) != 0) {
        func_0200e9c4();
        *(int *)0x04000540 = (data_020c3e48 << 1) | data_02103da0;
    }
    return 1;
}
