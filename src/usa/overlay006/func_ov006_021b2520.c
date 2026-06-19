/* func_ov006_021b2520: blank both display engines (clear the DISPCNT display-
 * mode bits on main + sub), run the per-frame display update, then fire the
 * optional teardown hook when the state struct's +8 field is live. Returns 1.
 * One of an 8-member family differing only in the per-state struct it tests
 * (see ov006_core.h §VERIFIED). */
extern void func_02021064(void);
extern void func_0200ad74(void);
extern int data_ov006_021cf020[];
int func_ov006_021b2520(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_02021064();
    if (data_ov006_021cf020[2] != 0)
        func_0200ad74();
    return 1;
}
