/* CAMPAIGN-PREP candidate for func_02093848 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear call sequence + u16-cast (lsl16;lsr16) + arg held in callee-saved
 *   risk:       Literal-pool order (_LIT0 before _LIT1) and scheduling of the 0x027ffc20 store vs mov r0,#0x10 may differ.
 *   confidence: med
 */
/* func_02093848: linear init sequence. Reads the u16 at 0x027ffc40, optionally
 * calls func_02093bfc, runs a fixed call chain, stashes its arg at 0x027ffc20,
 * then kicks func_020938c8(0x10) and a final hook. */
extern void func_02093bfc(void);
extern int  func_02090868(void);
extern void func_0209c014(int);
extern void func_02093d44(int);
extern void func_0209065c(int);
extern void func_020905a8(int);
extern void func_020938c8(int);
extern void func_01ff8624(void);

void func_02093848(int arg) {
    if (*(volatile unsigned short *)0x027ffc40 == 2)
        func_02093bfc();
    func_0209c014((unsigned short)func_02090868());
    func_02093d44(0);
    func_02093d44(1);
    func_02093d44(2);
    func_02093d44(3);
    func_0209065c(0x40000);
    func_020905a8(-1);
    *(volatile unsigned long *)0x027ffc20 = arg;
    func_020938c8(0x10);
    func_01ff8624();
}
