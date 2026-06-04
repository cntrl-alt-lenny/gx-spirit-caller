/* func_ov021_021aa7d8: blank both display engines (clear the DISPCNT display-mode
 * bits on main + sub), run the per-frame update, then fire the optional teardown
 * hook when the state struct's +8 field is live. Returns 1. gotcha (ov006 family
 * D): write the SUB register as an INLINE CAST (not derived from disp) so mwcc
 * keeps value=r0 / address=r1 — it still folds the address to `add r1,r2,#0x1000`
 * since r2 already holds the main base. (ov021_core.h) */
extern void func_020210b8(void);
extern void func_0200ad90(void);
extern int  data_ov021_021ace80[];
int func_ov021_021aa7d8(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    func_020210b8();
    if (data_ov021_021ace80[2] != 0)
        func_0200ad90();
    return 1;
}
