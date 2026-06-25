/* CAMPAIGN-PREP candidate for func_020905a8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IME-disable bracket + IF swap; dead volatile read; return old
 *   risk:       Reg-alloc of saved(r3)/old(r1) may flip; mwcc may drop the dead `*ime;` read; if so fall back to nofralloc asm (proven for this family). Med.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020905a8 (main, class A).
 * recipe:  NitroSDK IME-save/disable bracket around an IF-register swap.
 *   ip=0x04000208 (REG_IME, u16); r2=0x04000214 (REG_IF, u32).
 *   save IME -> IME=0 -> old=*IF -> *IF=arg -> (dead read IME) -> IME=saved -> return old.
 * The dead `*ime;` volatile read reproduces the orig's `ldrh r0,[ip]; mov r0,r1`.
 * Sibling currently ships as .s (reg-alloc-walled); this is the C front-load attempt.
 */
unsigned int func_020905a8(unsigned int v) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int   *reg = (volatile unsigned int *)0x04000214;
    unsigned short saved = *ime;
    unsigned int old;
    *ime = 0;
    old = *reg;
    *reg = v;
    *ime;            /* dead volatile read -> ldrh r0,[ip] */
    *ime = saved;
    return old;
}
