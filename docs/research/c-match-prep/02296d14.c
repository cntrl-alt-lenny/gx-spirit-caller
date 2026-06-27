/* CAMPAIGN-PREP candidate for func_02296d14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call result first (r0), table load second (r1); unsigned >= (cs/cc); dual-bitfield index
 *   risk:       reshape-able: UNSIGNED compare (movcs/movcc) requires both `func_02257ab8` ret and table read unsigned — keep both `unsigned int`; declare v before t to fix r0/r1 placement of cmp
 *   confidence: med
 */
typedef unsigned short u16;

struct S02296d14 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 rest : 10;
};

extern char data_ov002_022cf1a8[];
extern unsigned int func_ov002_02257ab8(unsigned int v);

int func_ov002_02296d14(struct S02296d14 *self) {
    unsigned int v = func_ov002_02257ab8(1 - self->b0);
    unsigned int t = *(unsigned int *)(data_ov002_022cf1a8 + (self->b0 & 1) * 0x868 + self->idx5 * 0x14);
    return v >= t;
}
