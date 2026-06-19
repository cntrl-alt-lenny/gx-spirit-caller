/* func_ov006_021b3c60: blank both display engines (clear the DISPCNT display-
 * mode bits on main + sub), run the per-frame display update, then fire the
 * optional teardown hook when the state struct's +8 field is live. Returns 1.
 * 8-member family differing only in the per-state struct tested (ov006_core.h
 * §VERIFIED). */
extern void func_02021064(void);
extern void func_0200ad74(void);
extern int data_ov006_0224f128[];
int func_ov006_021b3c60(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_02021064();
    if (data_ov006_0224f128[2] != 0)
        func_0200ad74();
    return 1;
}
