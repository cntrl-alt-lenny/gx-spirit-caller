/* func_ov006_021b5924: blank both display engines (clear the DISPCNT display-
 * mode bits on main + sub), run the per-frame display update, then fire the
 * optional teardown hook when the state struct's +8 field is live. Returns 1.
 * 8-member family differing only in the per-state struct tested (ov006_core.h
 * §VERIFIED). */
extern void func_020210b8(void);
extern void func_0200ad90(void);
extern int data_ov006_0224f38c[];
int func_ov006_021b5924(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_020210b8();
    if (data_ov006_0224f38c[2] != 0)
        func_0200ad90();
    return 1;
}
