/* CAMPAIGN-PREP candidate for func_0209065c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IME bracket + IE swap; dead volatile read; return old
 *   risk:       Reg-alloc of saved(r3)/old(r1) may flip; mwcc may elide the dead `*ime;`; sibling family shipped as .s, so nofralloc asm is the proven fallback. Med.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209065c (main, class A).
 * recipe:  IME-disable bracket around an IE swap (write arg, return old IE).
 *   ip=0x04000208 (REG_IME,u16); r2=0x04000210 (REG_IE,u32).
 *   save IME; IME=0; old=*IE; *IE=arg; (dead read IME); IME=saved; return old.
 * This is the project's `func_0209065c(value)->old` IE-writer that
 * func_020058b4.c / func_02005800.c call. Currently ships as .s.
 */
unsigned int func_0209065c(unsigned int v) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int   *ie  = (volatile unsigned int *)0x04000210;
    unsigned short saved = *ime;
    unsigned int old;
    *ime = 0;
    old = *ie;
    *ie = v;
    *ime;            /* dead volatile read -> ldrh r0,[ip] */
    *ime = saved;
    return old;
}
