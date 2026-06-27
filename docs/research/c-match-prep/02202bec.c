/* CAMPAIGN-PREP candidate for func_02202bec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0/b6 bitfields; decl f0,f4,f20 in load order; cmpeq chain via ||; mla index
 *   risk:       the f0==1-bit0 && f4==bit0 pair compiles to cmp;cmpeq (orig); the || short-circuit may instead branch each test. reshape-able (use & of two int comparisons if cmpeq diverges).
 *   confidence: med
 */
/* func_ov002_02202bec (cls D): optional arg1 equality guard, then self->b6==0x12,
 * then field-table cd3f4 checks (.f0==1-bit0 && .f4==bit0, .f20<=4), then subrow
 * .f30 (:13) bool. player index = (.f4 & 1), idx = .f20. Loads ordered .f0,.f4,.f20
 * to match the asm; rsb r1,r3,#1 = (1 - bit0). */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; u16 :5; u16 b6 : 6; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int :19; };
struct cd3f4_t { int f0; int f4; char _p[0x18]; int f20; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
int func_ov002_02202bec(struct self_t *self, u16 *other) {
    int bit0;
    int f0;
    int f4;
    int f20;
    if (other != 0) {
        if (*other == self->f0)
            return 0;
    }
    if (self->b6 != 0x12)
        return 0;
    bit0 = self->b0;
    f0 = ((struct cd3f4_t *)data_ov002_022cd3f4)->f0;
    f4 = ((struct cd3f4_t *)data_ov002_022cd3f4)->f4;
    f20 = ((struct cd3f4_t *)data_ov002_022cd3f4)->f20;
    if (f0 != 1 - bit0 || f4 != bit0)
        return 0;
    if (f20 > 4)
        return 0;
    return ((struct subrow *)(data_ov002_022cf16c + (f4 & 1) * 0x868 + f20 * 0x14))->f30 != 0;
}
