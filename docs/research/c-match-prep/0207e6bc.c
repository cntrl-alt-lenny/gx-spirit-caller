/* CAMPAIGN-PREP candidate for func_0207e6bc (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     COMMUTATIVE/predicated select: base first, ands-flag, dup field loads
 *   risk:       mwcc may branch instead of predicating both arms, or hoist the shared loads out
 *   confidence: med
 */
/* func_0207e6bc: flag-gated index*scale select.
 *
 *   ldrh   r1, [r0, #0x2]       ; flags = p->h2
 *   ands   r1, r1, #0x1
 *   ldrneh r1, [r0]             ; idx = p->h0
 *   ldrne  r0, [r0, #0x4]       ; base = p->base
 *   addne  r0, r0, r1, lsl #0x4 ; base + idx*16
 *   ldreqh r1, [r0]
 *   ldreq  r0, [r0, #0x4]
 *   addeq  r0, r0, r1, lsl #0x3 ; base + idx*8
 *   bx     lr
 *
 * Both arms reload p->h0 and p->base (predicated duplicate loads), so
 * reference the fields inside each branch (if/else, not a shared temp).
 */

typedef struct {
    unsigned short h0;   /* +0x0 index */
    unsigned short h2;   /* +0x2 flags */
    int            base; /* +0x4 */
} S0207e6bc;

int func_0207e6bc(S0207e6bc *p) {
    if (p->h2 & 1)
        return p->base + (p->h0 << 4);
    else
        return p->base + (p->h0 << 3);
}
