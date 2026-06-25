/* CAMPAIGN-PREP candidate for func_02090624 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IME bracket + IE orr RMW; operand-order old|v; return old
 *   risk:       Reg-alloc of saved(r3)/old(r1) may flip; orr operand order should hold (old-first); dead read may drop -> nofralloc asm fallback. Med.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02090624 (main, class A).
 * recipe:  IME-disable bracket around an IE read-modify-write (set bits, return old).
 *   ip=0x04000208 (REG_IME,u16); r2=0x04000210 (REG_IE,u32).
 *   save IME; IME=0; old=*IE; *IE = old | arg; (dead read IME); IME=saved; return old.
 * Commutative operand order: orig `orr r0,r1,r0` = old|arg with old (r1) first source,
 * so write `old | v` (accumulator/old first).
 */
unsigned int func_02090624(unsigned int v) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int   *ie  = (volatile unsigned int *)0x04000210;
    unsigned short saved = *ime;
    unsigned int old;
    *ime = 0;
    old = *ie;
    *ie = old | v;
    *ime;            /* dead volatile read -> ldrh r0,[ip] */
    *ime = saved;
    return old;
}
