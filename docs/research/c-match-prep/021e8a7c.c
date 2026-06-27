/* CAMPAIGN-PREP candidate for func_021e8a7c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two reads share (player&1)*0x868 => mul+add not mla; idx-first decl-order
 *   risk:       mwcc must CSE (player&1)*0x868 and idx*20 as separate products (asm mul r5,mul r4) across the two reads; if it folds one into mla the index diverges — reshape-able (don't bind a combined base)
 *   confidence: med
 */
/* func_ov002_021e8a7c (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * idx guard FIRST (uses 6 callee-saves r4-r8); two table reads (f30 bitfield +
 * cf1a2 halfword) => split mul+add index. Tail: cf1a2 hw !=0 ? 1 : 0.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021e8a7c(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    if (player == self->b0)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) != 0;
}
