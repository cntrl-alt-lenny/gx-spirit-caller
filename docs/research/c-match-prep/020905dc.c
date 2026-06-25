/* CAMPAIGN-PREP candidate for func_020905dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IME bracket + IE bic RMW (void); mvn-and; dead read
 *   risk:       Single-reg `sub sp,#4` epilogue may need the legacy_sp3 compiler; mvn/and operand regs (r1=~v) may differ; dead read may drop. Med-low.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020905dc (main, class A).
 * recipe:  IME-disable bracket around an IE read-modify-write (clear bits).
 *   lr=0x04000208 (REG_IME,u16); r2=0x04000210 (REG_IE,u32).
 *   r1=~arg; save IME; IME=0; old=*IE; *IE = old & ~arg; (dead read IME); IME=saved.
 *   VOID (orig does not return old). Note the `stmfd {lr}; sub sp,#4` prologue
 *   and `add sp,#4; ldmfd {lr}; bx lr` epilogue (Style-A single-reg frame).
 */
void func_020905dc(unsigned int v) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int   *ie  = (volatile unsigned int *)0x04000210;
    unsigned short saved = *ime;
    *ime = 0;
    *ie = *ie & ~v;
    *ime;            /* dead volatile read -> ldrh r1,[lr] */
    *ime = saved;
}
