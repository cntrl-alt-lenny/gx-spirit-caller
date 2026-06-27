/* CAMPAIGN-PREP candidate for func_021edf2c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f30 :13, poff/ioff computed pre-guard (orig hoists), unsigned (>>4)&1 bit-test
 *   risk:       orig computes poff/ioff + the f30 add BEFORE the cmp #5 (movge after), interleaved scheduling; r5/r4 hold poff/ioff across the 021c1e44 call. If mwcc sinks the math past the guard, schedule + add-order diverge. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021edf2c - CLASS D. f30 slot bitfield read FIRST (no self->b0 guard),
 * idx>=5 guard interleaved, helper 021c1e44 guard, then return bit4 of cf1ac word.
 * cf1ac element read as int, (>>4)&1 -> a plain right-shift+mask bit test.
 * f30 = unsigned :13 bitfield; final extract is asymmetric (lsr#4;and#1) raw C. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021c1e44(void);

int func_ov002_021edf2c(void *self, int player, int idx) {
    int poff, ioff;
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    if (idx >= 5)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + poff + ioff + 0x30))->id == 0)
        return 0;
    if (func_ov002_021c1e44() != 0)
        return 0;
    return (*(unsigned int *)(data_ov002_022cf1ac + poff + ioff) >> 4) & 1;
}
