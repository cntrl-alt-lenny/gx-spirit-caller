/* CAMPAIGN-PREP candidate for func_02023f28 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO bic/orr halfword RMW (masked operand first)
 *   risk:       the (u16) cast may insert an extra mov; mov r0,#1 scheduling could move; field offset 0xc8 guessed
 *   confidence: med
 */
/* func_02023f28: MMIO halfword RMW on REG (0x4000008): clear low 2
 * bits, OR in the signed-halfword field p->f_c8, write back; ret 1.
 * orr dest is the masked reg value (reg & ~3) first, then the field. */
int func_02023f28(char *p) {
    volatile unsigned short *reg = (volatile unsigned short *)0x4000008;
    signed short v = *(signed short *)(p + 0xc8);
    *reg = (unsigned short)((*reg & ~3) | v);
    return 1;
}
