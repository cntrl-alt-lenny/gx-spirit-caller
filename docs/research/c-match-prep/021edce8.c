/* CAMPAIGN-PREP candidate for func_021edce8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: bitfield b0:1, if-not-equal guard order, forward 3 args, bind cd3f4 base once
 *   risk:       orig binds cd3f4 in r0 across f4(+4)&f20(+0x20) reads (ldreq chained); if mwcc reloads or reorders the &&, 2 ldr + cmp order diverge. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021edce8 - CLASS D. self->b0 guard + idx range, forward (self,player,idx)
 * to 021c1ef0, then a cd3f4 field-pair compare tail returning bool.
 * Proven types from ov002_core.h (Ov002Self.b0 = u16:1 at +2; lsl#31;lsr#31).
 * NOTE: this addr already ships as whole-function .s (brief 302 endgame) - it was
 * the brief-287 deferred residue (cd3f4-arg tail reg-alloc wall). C is best-effort. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Cd3f4 { int _0; int f4; char _8[0x1c]; int f20; };
extern struct Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);

int func_ov002_021edce8(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (self->b0 != player)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (data_ov002_022cd3f4.f4 == player && data_ov002_022cd3f4.f20 == idx)
        return 0;
    return 1;
}
