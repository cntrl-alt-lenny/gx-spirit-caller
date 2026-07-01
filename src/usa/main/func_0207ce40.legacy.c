/* CAMPAIGN-PREP candidate for func_0207ce40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ wrapper + &&-guard + inner call result; sp2p3 tier
 *   risk:       && may branch-skip vs the asm's beq/bne layout; result reg r4 reuse; otherwise clean
 *   confidence: high
 */
/* func_0207ce40: IRQ-bracketed guarded call. DisableIrq first (saved in a
 * callee reg, calls follow). result=0; if base!=0 && base->f2260==9 ->
 * result=func_0207cd68(). Style A epilogue with sub-sp, push {r4,r5,lr}
 * -> `.legacy.c` (mwcc 1.2/sp2p3). */

typedef struct {
    char _pad[0x2260];
    int  f2260;                  /* +0x2260 */
} ctx_cf28_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern ctx_cf28_t *func_0207b450(void);
extern int  func_0207cd68(void);

int func_0207ce40(void) {
    int         saved = OS_DisableIrq();
    ctx_cf28_t *base = func_0207b450();
    int         result = 0;
    if (base != 0 && base->f2260 == 9) {
        result = func_0207cd68();
    }
    OS_RestoreIrq(saved);
    return result;
}
