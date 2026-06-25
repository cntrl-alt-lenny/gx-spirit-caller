/* CAMPAIGN-PREP candidate for func_0207cc50 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ wrapper + &&-chain conditional ptr-add (pool const); sp2p3 tier
 *   risk:       0x2144 materialisation (pool vs computed); saved-mask staying in r0 vs callee reg; field offsets guessed
 *   confidence: high
 */
/* func_0207cc50: IRQ-bracketed guarded pointer accessor. result=0; if
 * base!=0 && base->f2260==9 && base->b226b==0 -> result = base+0x2144.
 * base fetched before DisableIrq; saved mask survives in r0 (no calls in
 * body). Style A epilogue with sub-sp, push {r4,r5,lr} -> `.legacy.c`
 * (mwcc 1.2/sp2p3). 0x2144 is not an encodable imm -> pool-word add. */

typedef struct {
    char           _pad[0x2260];
    int            f2260;        /* +0x2260 */
    char           _pad2[0xa];
    unsigned char  b226b;       /* +0x226b */
} ctx_cc50_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern ctx_cc50_t *func_0207b538(void);

void *func_0207cc50(void) {
    void       *result = 0;
    ctx_cc50_t *base = func_0207b538();
    int         saved = OS_DisableIrq();
    if (base != 0 && base->f2260 == 9 && base->b226b == 0) {
        result = (char *)base + 0x2144;
    }
    OS_RestoreIrq(saved);
    return result;
}
