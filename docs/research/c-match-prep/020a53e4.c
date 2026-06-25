/* CAMPAIGN-PREP candidate for func_020a53e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword global loads + arg-passing to two calls
 *   risk:       5th (stack) arg load scheduling and 4 halfword reload order may reorder vs orig
 *   confidence: low
 */
/* func_020a53e4: load four u16 globals, marshal into two calls. sp2p3 (.legacy.c).
 *   r0 = func_0209e8d0(&func_020a4b6c); func_020a35dc(0x80, r0);
 *   func_020a06b0(&func_020a4b6c, *021026f8, *021026f0, *021026ec, *021026f4);
 *   func_020a35dc(0x1d, r0);
 * func_020a35dc takes (u16,u16) per its own .legacy.c. The 5th arg of
 * func_020a06b0 is passed on the stack (str r3,[sp]). */

extern void *func_0209e8d0(void *arg);
extern void  func_020a35dc(unsigned short a, unsigned short b);
extern int   func_020a06b0(void *p, unsigned short b, unsigned short c,
                           unsigned short d, unsigned short e);
extern void  func_020a4b6c(void);

extern unsigned short data_021026ec;
extern unsigned short data_021026f0;
extern unsigned short data_021026f4;
extern unsigned short data_021026f8;

void func_020a53e4(void) {
    int r;
    r = (int)func_0209e8d0((void *)func_020a4b6c);
    func_020a35dc(0x80, (unsigned short)r);
    r = func_020a06b0((void *)func_020a4b6c, data_021026f8, data_021026f0,
                      data_021026ec, data_021026f4);
    func_020a35dc(0x1d, (unsigned short)r);
}
