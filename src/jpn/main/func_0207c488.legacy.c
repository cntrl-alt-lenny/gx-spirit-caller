/* CAMPAIGN-PREP candidate for func_0207c488 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     predicated-return guarded accessor (&& chain); sp2p3 tier
 *   risk:       the && may emit beq-skip instead of the asm's predicated hi-return; head load width assumed word
 *   confidence: high
 */
/* func_0207c488: guarded accessor -> returns list head (f2270->f4) when
 * f2270!=0 && count>0xc, else 0. Style A epilogue with sub-sp, single
 * push {lr} only (no callee regs needed; func_0207b450 is the only call,
 * base stays caller-saved) -> `.legacy.c` (mwcc 1.2/sp2p3). */

typedef struct {
    char         _pad[0x4];
    void        *head;            /* +0x4 */
} list_c570_t;

typedef struct {
    char          _pad[0x2270];
    list_c570_t  *list;          /* +0x2270 */
    unsigned int  count;        /* +0x2274 */
} ctx_c570_t;

extern ctx_c570_t *func_0207b450(void);

void *func_0207c488(void) {
    ctx_c570_t  *ctx = func_0207b450();
    list_c570_t *p = ctx->list;
    if (p != 0 && ctx->count > 0xc) {
        return p->head;
    }
    return 0;
}
