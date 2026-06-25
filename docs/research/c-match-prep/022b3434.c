/* CAMPAIGN-PREP candidate for func_022b3434 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Short-circuit && guard-chain; value left in r0 + dead cmpne
 *   risk:       mwcc may normalize && to movne/moveq 0/1 (adds movs the asm lacks); the asm leaves the raw value, so a plain && is the likely-but-uncertain match.
 *   confidence: low
 */
/* func_ov002_022b3434: tiny guard-chain. Loads p->f4; if nonzero loads
 * p->fc (else r0 keeps the input pointer); trailing cmpne is a dead test
 * (flags unused after bx). Short-circuit && leaving the value in r0.
 *
 *     ldr   r1, [r0, #0x4]
 *     cmp   r1, #0x0
 *     ldrne r0, [r0, #0xc]
 *     cmpne r0, #0x0
 *     bx    lr
 */

struct S022b3434 {
    char _pad0[4];
    int  f4;   /* +0x4 */
    char _pad8[4];
    int  fc;   /* +0xc */
};

int func_ov002_022b3434(struct S022b3434 *p) {
    return p->f4 && p->fc;
}
