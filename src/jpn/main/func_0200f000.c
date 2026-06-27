/* CAMPAIGN-PREP candidate for func_0200f000 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Null-guard (moveq/bxeq) + bic/orr/bic flag RMW in source order
 *   risk:       field offset 0x60 guessed; the three bic/orr stay split only if written as three statements, else mwcc may fuse masks.
 *   confidence: high
 */
/* func_0200f000: null-guard, then rewrite flag word at +0x60:
 *   if (p == 0) return 0;
 *   v = [p+0x60];
 *   v = (v & ~4) | 8;        (bic #4; orr #8)
 *   v &= ~0x1e00000;         (bic #0x1e00000)
 *   [p+0x60] = v;
 *   return 1;
 */

struct Obj0200f01c {
    char pad[0x60];
    unsigned int flags;   /* +0x60 */
};

int func_0200f000(struct Obj0200f01c *p) {
    unsigned int v;
    if (p == 0) return 0;
    v = p->flags;
    v = (v & ~4u) | 8u;
    v &= ~0x1e00000u;
    p->flags = v;
    return 1;
}
