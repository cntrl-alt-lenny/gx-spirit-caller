/* CAMPAIGN-PREP candidate for func_02202b2c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit bitfield extract; 3-way equality OR -> chained cmpne
 *   risk:       mwcc may range-opt 6||7||8 to sub#6;cmp#2;movls instead of orig's cmp;cmpne;cmpne chain
 *   confidence: low
 */
/* func_ov002_02202b2c: trivial leaf bool — kind(6-bit @bit6) is 6, 7 or 8. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };

int func_ov002_02202b2c(struct Self *self) {
    int k = self->kind;
    if (k == 6 || k == 7 || k == 8)
        return 1;
    return 0;
}
