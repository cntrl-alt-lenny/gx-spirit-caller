/* CAMPAIGN-PREP candidate for func_02013a64 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork guard-chain + conditional orr-store (set bit 0x100)
 *   risk:       field@0x91c unsigned >2 (ldmhi); call results 0x6a/4 are equality gates; read-modify-write of 0x8f8
 *   confidence: high
 */
/* func_02013a64: if state[0x91c] > 2 (unsigned) bail; else require
 * func_02019664()==0x6a and func_0201969c()==4, then OR bit 0x100 into
 * state[0x8f8]. */

extern char *GetSystemWork(void);
extern int func_02019664(void);
extern int func_0201969c(void);

void func_02013a64(void) {
    char *s = GetSystemWork();
    if (*(unsigned int *)(s + 0x91c) > 2) return;
    if (func_02019664() != 0x6a) return;
    if (func_0201969c() != 4) return;
    *(int *)(s + 0x8f8) |= 0x100;
}
